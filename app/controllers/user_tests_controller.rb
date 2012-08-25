class UserTestsController < ApplicationController
    
  require 'json'  
    
  def create
    
    if session[:user_id].present?
      
     user_test = UserTest.create(:user_id => session[:user_id], 
                                 :section_id => params[:section_id], 
                                 :time_remaining => Section.where(:id => params[:section_id]).first.time_per_test
                                )
      
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
    render json: JSON.pretty_generate(JSON.parse(@question.to_json(:include => { :question => { :methods => [:answers, :topic] } })))
    end  
    
    @user_test = UserTest.find(session[:user_test_id])
    
    if params[:time_remaining].present? 
    @user_test.time_remaining = params[:time_remaining]
    @user_test.save
    end
        
    @testlet1, @testlet2, @testlet3 = [], [], []
    @correct_answers, @wrong_answers = 0, 0
    
    @user_test.user_test_questions.each_with_index do |utq, index|
      qpt = utq.question.topic.section.questions_per_testlet
      case index
        when 0...qpt
          @testlet1 << utq
        when qpt...(qpt*2)
          @testlet2 << utq
        when (qpt*2)..90
          @testlet3 << utq
      end  
      
      if utq.answered_correct != nil
        utq.answered_correct? ? @correct_answers +=1 : @wrong_answers +=1
      end
      
    end
    
  end
  
  def finish
    @utq = UserTestQuestion.where(:user_test_id => session[:user_test_id]).order('id asc')
    @score = 0
      @utq[0].user_test.user_test_questions.each do |answered_question|
        answered_question.answered_correct? ? @score += 1 : @score += 0
      end
    @score = (@score.to_f / (@utq[0].user_test.section.questions_per_testlet * 3)*100).roundup(1).to_i
    
    user_test = UserTest.find(session[:user_test_id])
    user_test.score = @score
    user_test.save
  end
  
  def update
    question_number = (params[:question_number].to_i - 1)
    answered = params[:answer] == "correct" ? true : false
    
    utq = UserTestQuestion.where(:user_test_id => session[:user_test_id]).offset(question_number-1).limit(1)[0]
    utq.answered_correct = answered
    utq.save

    redirect_to "/user_test"
  end
  
end
