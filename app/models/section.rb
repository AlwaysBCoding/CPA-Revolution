class Section < ActiveRecord::Base
  attr_accessible :name, :code, :questions_per_testlet, :time_per_test
  
  has_many :topics
  has_many :user_tests
end
