class Group
	include Mongoid::Document

	#name of group when entered
	field :group_name, type: String
	has_and_belongs_to_many :users
	#If we want to let groups set their email
	#field :custom_email, String
	#otherwise, the group email is used

	#automagically generate emails for groups based on their group name and the domain (default = "@encryptomail.net")
	#The problem is 	
	#def email
	#	group_name + Encryptomail::Application.$Domain
	#end
	
	field :email, type: String

	#Encryption keys
	field :pub_key, type: String
	field :pri_key, type: String

	#Default for booleans should be false

	#True if the group cannot change size, false if it is dynamic.
	field :lock_members, type: Boolean

	#True if the group is to be listed openly, false if not.
	field :visible, type: Boolean

	#True if only group members can send to group email, false if open for everyone.
	field :private, type: Boolean

	field :description, type: String
	
	field :leaders, type: Array
	
	
	validates_uniqueness_of :group_name
	
	index({ group_name: 1 }, { unique: true, name: "group_name_index" })
	index({ email: 1 }, { unique: true, name: "email_index" })	
	
	def leader?(user)
		if leaders.nil? 
			false	
		else
			leaders.include?( user.id.to_s)		
		end
	end
	
	def addUser(email)
		if email.nil?
			false
		else
			if User.where(email: email).exists?
				u = User.find_by(email: email)
			else
				u = nil
				#TBD: Send invite email to email
			end
			self.users << u
		end
	
	end

	
end
