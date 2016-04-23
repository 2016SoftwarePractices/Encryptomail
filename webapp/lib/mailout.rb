require 'mongoid'
require 'mongo'
require 'json'

#For some reason this supresses mongoDB debug messages.... so yeah
Mongoid.load!("/var/www/Encryptomail/webapp/config/mongoid.yml", :production)

#Include Mongo so classes are available without specifying the Mongo namespace
include Mongo

db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'encryptomail_test')

# Lets loop through the directory where the emails live
Dir.foreach('/home/infiniterecursion/Maildir/new') do |item|
	#ignore these
	next if item == '.' or item == '..'
	#Lets open each file in the directory as we get to them
	file = File.open('/home/infiniterecursion/Maildir/new/' + item, "r")
	data = file.read
	#Get our to/from fields
	from = data.scan(/From:\s[\w].*<([A-Za-z0-9@_.+].+)>/)
	#Regex makes two matches, to field and the ID as a second part
	# so to[0] will be the email and to[1] will be the group id that generated the email address
	to = data.scan(/\sTo:\s([A-Za-z0-9_@]+\+([A-Fa-f0-9]{24})@[A-za-z0-9_+.]+)\s/).flatten
	file.close
	#add file to delete queue
	#

	#Some output
	puts "\n\n======================================================"
	puts 'Email: '
	puts item
	puts 'From: '
	puts from
	puts 'To: '
	puts to

	
	#Check if group exists
	begin
		puts "\n[!] Checking Group"
		groups = db[:groups]
		this_group = Hash.new
		groups.find(:_id => BSON::ObjectId(to[1])).each do |data|
			this_group = data.to_h
		end
		puts "[!] Group found in database."
		#puts this_group["user_ids"][0]
	rescue Exception => e
		puts "\n[!] No group found."
		puts e.message
		puts e.backtrace.inspect
		next
	end

	#Check if sender belongs to group
	begin
		#First we need to get the user ids and compare our email to each of them in the DB until we find the appropriate user
		puts "\n[!] Checking User"
		this_user = Hash.new
		#Lets get the list of user id's from the group the email is going to
		groups_users = []
		groups_users = this_group["user_ids"]
		#Now lets loop through these id's until we find one with a matching email as the sender
		groups_users.each { |x|
			users = db[:users]
			users.find(:_id => BSON::ObjectId(x)).each do |data|
				temphash = data.to_h
				puts temphash["email"]
				puts from[0][0]
				if from[0][0] == temphash["email"] then
					puts "[!] The sender is part of that group."
				else
					puts "[!] Sender NOT part of the group."
				end
			end
		}
	rescue Exception => e
		puts "\n[!] User unknown to group."
		puts e.message
		puts e.backtrace.inspect
		next
	end


	#IF we have got to here we know a few things
	#	1. The group exists
	#	2. The person who sent the email is part of the group
	# Also we have a list of the groups user id's so we can iterate through those now
	# and encrypt a copy of the email for each of them.
	
	decrypted_message = EmailApp::Email_handler.decryptMailString(data, "asldkfjlksdjf")
	puts decrypted_message
	EmailApp::Email_handler.sendLoop(decrypted_message, groupMembersList)
	



	#Decrypt body with groups private key

	#Re-encrypt email for each member of the group (using their public key)

	#Send out emails to the members

end

#After looping through all the emails in the directory we will go through
# our delete queue and remove them
