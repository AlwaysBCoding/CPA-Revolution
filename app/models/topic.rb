class Topic < ActiveRecord::Base
  attr_accessible :section_id, :code, :name, :parent_code
  
  belongs_to :section
  has_many :questions
  
  def self.questions_from_code(code)
    Question.where(:topic_id => (Topic.where(:code => code)).first.id)   
  end
  
end
