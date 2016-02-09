class User
  include Mongoid::Document
  
  has_and_belongs_to_many :groups
  
  field :user_name, type: String
  field :pass_hash, type: String
  
  field :email, type: String
  field :pub_key, type: String
  
  
  
  field :register_date, type: DateTime, :default => DateTime.now
  
  validates_presence_of :passHash
  validates_uniqueness_of :email
  validates_uniqueness_of :pubKey
  
  
end
