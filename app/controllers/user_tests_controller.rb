class UserTestsController < ApplicationController
    
  def create
    
    if session[:user_id].present?
      
     user_test = UserTest.create(user_id: session[:user_id], section_id: params[:section_id])
      
     Question.find(:all, :order => "RANDOM()", :limit => (user_test.section.questions_per_testlet * 3)).each do |question|
      
       utq = UserTestQuestion.new
       utq.user_test_id = user_test.id
       utq.question_id = question.id
       utq.save
      
     end
      
      session[:user_test_id] = user_test.id
      redirect_to '/user_test'
    else 
      flash[:notice] = "In order to generate a full length practice test you need to be signed in"
      redirect_to '/signin'
    end
   
  end
  
  def show
    if params[:question].present?
    @question = UserTestQuestion.where(:user_test_id => session[:user_test_id]).offset(params[:question].to_i - 1).limit(1)[0]
    render json: @question.to_json(:include => { :question => { :methods => [:answers, :topic] } })
    end  
    
    @user_test = UserTest.find(session[:user_test_id])
    @testlet1, @testlet2, @testlet3 = [], [], []
    
    @user_test.section.questions_per_testlet.times do |i|
      @testlet1 << @user_test.questions[i]
      @testlet2 << @user_test.questions[@user_test.section.questions_per_testlet+i]
      @testlet3 << @user_test.questions[(@user_test.section.questions_per_testlet * 2)+i]
    end
  end
  
  def finish
    @utq = UserTestQuestion.where(:user_test_id => session[:user_test_id])
    
  end
  
  def update
    question_number = params[:question_number].to_i
    answered = params[:answer] == "correct" ? true : false
    
    utq = UserTestQuestion.where(:user_test_id => session[:user_test_id]).offset(question_number-1).limit(1)[0]
    p utq
    utq.answered_correct = answered
    utq.save

    redirect_to "/user_test"
  end
  
end
