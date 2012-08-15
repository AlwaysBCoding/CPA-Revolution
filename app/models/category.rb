class Category < ActiveRecord::Base
  attr_accessible :code, :name, :section_id
  
  belongs_to :section
  has_many :subclasses
end
