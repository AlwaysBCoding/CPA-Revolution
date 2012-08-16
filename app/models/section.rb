class Section < ActiveRecord::Base
  attr_accessible :name, :code
  
  has_many :topics
end
