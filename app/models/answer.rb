class Answer < ActiveRecord::Base
  attr_accessible :question_id, :answer_text, :correct
  
  belongs_to :question
end
