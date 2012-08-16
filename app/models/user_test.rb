class UserTest < ActiveRecord::Base
  attr_accessible :user_id, :score
  
  belongs_to :user
  has_and_belongs_to_many :questions, join_table: :user_test_question
end
