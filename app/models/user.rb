class User
  include Mongoid::Document
  
  has_and_belongs_to_many :group
  
  field :userName, type: String
  field :passHash, type: String
  
  field :email, type: String
  field :pubKey, type: String
  
  
  
  field :register_date, type: DateTime
  
  
  
end
