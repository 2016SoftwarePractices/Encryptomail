#!/usr/bin/env ruby

require 'mongoid'
require 'mongo'
require 'json'
require 'net/smtp'

load '/var/www/Encryptomail/webapp/lib/email_handler.rb'

#This is an embarassing ruby script
# This needs to be remade into not such a mess, and probably we can do this with rails instead of having
# a nasty script run with a cron job

#For some reason this supresses mongoDB debug messages.... so yeah
Mongoid.load!("/var/www/Encryptomail/webapp/config/mongoid.yml", :production)

#Include Mongo so classes are available without specifying the Mongo namespace
include Mongo

db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'encryptomail_test')

#Delete Queue, we will add up our emails after they are dealt with and then delete them after we are done
del_queue = []

# Lets loop through the directory where the emails live
Dir.foreach('/home/infiniterecursion/Maildir/new') do |item|
	$check_var = false
	#ignore these
	next if item == '.' or item == '..'
	#Lets open each file in the directory as we get to them and do stuff
	file = File.open('/home/infiniterecursion/Maildir/new/' + item, "r")
	data = file.read
	#Get our to/from fields
	from = data.scan(/From:\s[\w].*<([A-Za-z0-9@_.+].+)>/)
	#Regex makes two matches, to field and the ID as a second part
	# so to[0] will be the email and to[1] will be the group id that generated the email address
	to = data.scan(/\sTo:\s([A-Za-z0-9_@]+\+([A-Fa-f0-9]{24})@[A-za-z0-9_+.]+)\s/).flatten
	file.close

	#Some output
	puts "\n[!] Processing"
	puts "From:"
	puts from
	puts "=============="
	puts "To:"
	puts to
	puts "=============="
	puts "Item in Dir:"
	puts item
	puts "=============="
	
	#Check if group exists
	begin
		puts "\n[!] Checking Group"
		groups = db[:groups]
		this_group = Hash.new
		groups.find(:_id => BSON::ObjectId(to[1])).each do |data|
			this_group = data.to_h
		end
		puts "\n[!] Group found in database."
	rescue Exception => e
		puts "\n[!] No group found."
		puts e.message
		puts e.backtrace.inspect
		del_queue << item
		next
	end

	#Check if sender belongs to group
	begin
		#First we need to get the user ids and compare our email to each of them in the DB until we find the appropriate user
		puts "\n[!] Checking User"
		this_user = Hash.new
		#Lets get the list of user id's from the group the email is going to
		groups_users = this_group["user_ids"]
		#Now lets loop through these id's until we find one with a matching email as the sender
		groups_users.each { |x|
			if $check_var then
				next
			end
			users = db[:users]
			users.find(:_id => BSON::ObjectId(x)).each do |data|
				temphash = data.to_h
				if from[0][0] == temphash["email"] then
					puts "\n[!] The sender is part of that group."
					$check_var = true
				end
			end
		}
	rescue Exception => e
		puts "\n[!] The sender is not part of that group."
		puts e.message
		puts e.backtrace.inspect
		del_queue << item
		next
	end

	#Another check to ensure we found the user in the group
	if $check_var == false then
		puts "\n[!] The sender is not part of that group."
		del_queue << item
		next
	end
	
	#IF we have got to here we know a few things
	#	1. The group exists
	#	2. The person who sent the email is part of the group
	# Also we have a list of the groups user id's so we can iterate through those now
	# and encrypt a copy of the email for each of them.
	begin
        	decrypted_message = EmailApp::Email_handler.decryptMailString(data, "asldkfjlksdjf")
	rescue Exception => e
		puts "\n[!] Unable to decrypt."
		puts e.message
		puts e.backtrace.inspect
		next
	end


	groups_users.each { |x|
        	users = db[:users]
                users.find(:_id => BSON::ObjectId(x)).each do |data|
                	temphash = data.to_h
			begin
				encrypted_message = EmailApp::Email_handler.encryptMailString(decrypted_message, temphash["email"])
			rescue Exception => e
				puts "[!] Failed to encrypt for: "
				puts temphash["email"]
				puts e.message
				puts e.backtrace.inspect
				next
			end

			begin
				message = <<MESSAGE_END
				From: Private Person <#{to[0]}>
				To: A Test User <#{temphash["email"]}>
				MIME-Version: 1.0
				Content-type: text/html
				Subject: SMTP e-mail test

				This #{encrypted_message}
MESSAGE_END

				Net::SMTP.start('localhost') do |smtp|
  					smtp.send_message message, to[0], temphash["email"]
				end

			rescue Exception => e
				puts "[!] Failed to mail to: "
				puts temphash["email"]
				puts e.message
				puts e.backtrace.inspect
			end
	        end	
        }
	del_queue << item	
end
#After looping through all the emails in the directory we will go through
# our delete queue and remove them

del_queue.each { |item| 
	File.delete("/home/infiniterecursion/Maildir/new/" + item)
}
