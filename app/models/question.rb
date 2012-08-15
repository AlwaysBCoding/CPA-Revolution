class Question < ActiveRecord::Base
  attr_accessible :difficulty, :number, :question_text, :subclass_id
  
  belongs_to :subclass
  has_one :answer
end
