class User
  include Mongoid::Document
  
  belongs_to_many :group
  
  field :userName, type: String
  field :passHash, type: String
  
  field :email, type: String
  field :pubKey, type: String
  
  
  
  field :register_date, type: DateTime
  
  
  
end
