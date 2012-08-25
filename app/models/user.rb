class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_digest, :password, :password_confirmation, :far_date, :reg_date, :bec_date, :aud_date, :far_score, :reg_score, :bec_score, :aud_score
  
  has_many :user_tests
  
  has_secure_password
  
  validates_uniqueness_of :email
  validates_uniqueness_of :username

end
