class Variable < ActiveRecord::Base
  attr_accessible :question_id, :description, :format, :maximum, :minimun, :multiple
  
  belongs_to :question
end
