class UserTestQuestion < ActiveRecord::Base
  attr_accessible :user_test_id, :question_id, :answered_id
  
  belongs_to :user_test
  belongs_to :question
  
end
