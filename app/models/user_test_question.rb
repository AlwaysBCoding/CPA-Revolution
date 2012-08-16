class UserTestQuestion < ActiveRecord::Base
  attr_accessible :test_id, :question_id, :answered_id
end
