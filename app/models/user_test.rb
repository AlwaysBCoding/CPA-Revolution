class UserTest < ActiveRecord::Base
  attr_accessible :user_id, :score, :section_id, :time_remaining, :completed
  
  belongs_to :user
  belongs_to :section
  has_many :user_test_questions
  has_many :questions, :through => :user_test_questions
  
  before_save :is_finished?
  
  def is_finished?
    utq = self.user_test_questions
    utq.count > 0 && utq.where(:answered_correct => nil).count == 0 ? self.completed = true : "";
  end
  
  def section
    if user_test_questions.first
    user_test_questions.first.question.topic.section
    else
    Section.first 
    end
  end

end
