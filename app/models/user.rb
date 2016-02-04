class User
  include Mongoid::Document
  
  field :userName, type: String
  field :passHash, type: String
  
  field :email, type: String
  field :pubKey, type: String
  
  
  
  field :register_date, type: DateTime
  
  
  
end
