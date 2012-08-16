class Topic < ActiveRecord::Base
  attr_accessible :section_id, :code, :name, :parent_code
  
  belongs_to :section
  has_many :questions
end
