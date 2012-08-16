class Question < ActiveRecord::Base
  attr_accessible :topic_id, :question_text, :difficulty
  
  has_and_belongs_to_many :user_tests, join_table: :user_test_questions
  has_many :answers
end
