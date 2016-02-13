class Group
  include Mongoid::Document
  
  #name of group when entered
  field :group_name, type: String
  has_and_belongs_to_many :users
  #If we want to let groups set their email
  #field :custom_email, String
  #otherwise, the group email is used
  
  #automagically generate emails for groups based on their group name and the domain (default = "@encryptomail.net")
  def email 
     group_name + Encryptomail::Application.Domain
  end
  
  
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
  
  
end
