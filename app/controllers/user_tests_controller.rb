class UserTestsController < ApplicationController
  
  def create
    
    if cookies[:user_id].present?
      
     user_test = UserTest.create(user_id: cookies[:user_id])
      
     Question.find(:all, :order => "RANDOM()", :limit => 90).each do |question|
      
       utq = UserTestQuestion.new
       utq.user_test_id = user_test.id
       utq.question_id = question.id
       utq.save
      
     end
      
      cookies[:user_test_id] = user_test.id
      redirect_to '/user_test'
    else 
      redirect_to '/signin'
    end
   
  end
  
  def show
    @user_test = UserTest.find(cookies[:user_test_id])
  end
  
end
