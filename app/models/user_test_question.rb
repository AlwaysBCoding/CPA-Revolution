class UserTestQuestion < ActiveRecord::Base
  attr_accessible :user_test_id, :question_id, :answered
  
  belongs_to :user_test
  belongs_to :question
  
  def section
    question.topic.section
  end
  
  def addQuestionColoring
    if answered_correct?
      "answered answeredCorrect"
    elsif answered_correct == false
      "answered answeredWrong"  
    end
  end
  
end
