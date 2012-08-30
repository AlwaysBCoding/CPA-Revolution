class Question < ActiveRecord::Base
  attr_accessible :topic_id, :question_text, :difficulty, :source
  
  has_many :user_test_questions
  has_many :user_tests, :through => :user_test_questions
  
  has_many :answers
  has_many :variables
  belongs_to :topic
  
  def question_text
    RedCloth.new(self[:question_text]).to_html
  end
end
