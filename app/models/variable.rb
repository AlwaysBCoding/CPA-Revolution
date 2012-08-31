class Variable < ActiveRecord::Base
  attr_accessible :question_id, :description, :format, :maximum, :minimum, :multiple
  
  belongs_to :question
  
  def generate
    case format
    when "integer"
      rand(minimum..maximum).roundup(multiple)
    when "dollar"
      "$" + rand(minimum..maximum).roundup(multiple).to_s.add_commas  
    when "percentage"
      rand(minimum..maximum).roundup(multiple).to_s + "%"
    when "company"
      "Antares"
    end      
  end

end

