require 'mongoid'
load 'webapp/app/models/group.rb'

db = Mongoid.load!("webapp/config/mongoid.yml", :production);


Dir.foreach('/home/infiniterecursion/Maildir/new') do |item|
	next if item == '.' or item == '..'
	
	file = File.open('/home/infiniterecursion/Maildir/new/' + item, "r")
	data = file.read
	from = data.scan(/From:\s[\w].*<([A-Za-z0-9@_.+].+)>/)
	to = data.scan(/\sTo:\s([A-Za-z0-9_@]+\+([A-Fa-f0-9]{24})@[A-za-z0-9_+.]+)\s/)
	file.close
	#add file to delete queue
	puts "======================================================"
	puts from
	puts to
	
	#Check if group exists
	puts "if group found here"
	puts Group.where(email: to)
	puts "-----"
	#Check if sender belongs to group

	#Decrypt body with groups private key

	#Re-encrypt email for each member of the group (using their public key)

	#Send out emails to the members


end

#After looping through all the emails in the directory we will go through
# our delete queue and remove them
