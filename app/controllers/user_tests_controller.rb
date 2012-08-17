class UserTestsController < ApplicationController
  
  def create
    
    if session[:user_id].present?
      
     user_test = UserTest.create(user_id: session[:user_id])
      
     Question.find(:all, :order => "RANDOM()", :limit => 90).each do |question|
      
       utq = UserTestQuestion.new
       utq.user_test_id = user_test.id
       utq.question_id = question.id
       utq.save
      
     end
      
      session[:user_test_id] = user_test.id
      redirect_to '/user_test'
    else 
      redirect_to '/signin'
    end
   
  end
  
  def show
    if params[:question].present?
    @question = UserTest.find(session[:user_test_id]).questions[params[:question].to_i-1]
    render json: @question.to_json(:include => [:answers])
    end  
    
    @user_test = UserTest.find(session[:user_test_id])
    @testlet = []
    
    30.times do |i|
      @testlet << @user_test.questions[i]
    end
  end
  
end
