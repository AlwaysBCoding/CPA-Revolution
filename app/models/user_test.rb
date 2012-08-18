class UserTest < ActiveRecord::Base
  attr_accessible :user_id, :score
  
  belongs_to :user
  has_many :user_test_questions
  has_many :questions, :through => :user_test_questions
end
