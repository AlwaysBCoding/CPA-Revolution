class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_digest, :password, :password_confirmation
  
  has_many :user_tests
  
  has_secure_password
  
  validates_uniqueness_of :email
  validates_uniqueness_of :username
end
