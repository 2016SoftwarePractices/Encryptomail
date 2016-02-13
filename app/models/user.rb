class User
  include Mongoid::Document
  
  has_and_belongs_to_many :groups
  
  field :user_name, type: String
  field :password1, type: String
  field :password2, type: String
  
  field :email, type: String
  field :pub_key, type: String
  
  
  
  field :register_date, type: DateTime, :default => DateTime.now
  
  validates_presence_of :password1
  validates_presence_of :password2
  
  validates_uniqueness_of :email
  validates_uniqueness_of :pub_key
  
  
end
