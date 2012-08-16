class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_digest
  
  has_many :user_tests
  
  # has_secure_password
end
