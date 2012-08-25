class UserTest < ActiveRecord::Base
  attr_accessible :user_id, :score, :section_id, :time_remaining
  
  belongs_to :user
  belongs_to :section
  has_many :user_test_questions
  has_many :questions, :through => :user_test_questions
end
