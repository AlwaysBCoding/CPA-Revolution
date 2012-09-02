class UserTestQuestion < ActiveRecord::Base
  attr_accessible :user_test_id, :question_id, :answered
  
  belongs_to :user_test
  belongs_to :question
  
  def section
    question.topic.section.code
  end
  
end
