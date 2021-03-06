class UserTestsController < ApplicationController
    
  require 'json'  
    
  def create # POST /user_test
    
    # If the user is logged in, Create a new user_test, and generate the corresponding user_test_questions
    # Generate a new session with the user_test_id, so a user only has 1 test active at a time
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
      
    user = User.find(session[:user_id])
    user.active_test = user_test.id
    user.save
    
      redirect_to '/user_test'
      
    else 
      flash[:notice] = "In order to generate a full length practice test you need to be signed in"
      redirect_to '/signin'
    end
   
  end
  
  def show # GET /user_test
    
    @user = User.find(session[:user_id])
    
    # If the request has a ?question= at the end of it, then render the JSON data of the question
    if params[:question].present?
      @user_test_question = UserTestQuestion.where(:user_test_id => @user.active_test).offset(params[:question].to_i - 1).limit(1)[0]
      
      render json: { question: @user_test_question.question, answers: @user_test_question.question.answers, topic: @user_test_question.question.topic }
      
    end  
    
    @user_test = UserTest.find(@user.active_test)
    
    # Only do this when the user calls the show page, not for creating JSON or logging time
    if params[:question].present? == false && params[:time_remaining].present? == false
      
      # Initialize the tetlets and running score    
      @testlet1, @testlet2, @testlet3 = [], [], []
      @correct_answers, @wrong_answers, @activeQuestionOnLoad, @currentTestlet = 0, 0, 0, 0
    
      # Find the id of the first unsanswered question to find activeQuestionOnLoad
      @qpt = @user_test.section.questions_per_testlet
      active_id = @user_test.user_test_questions.where(:answered_correct => nil).order('id asc').first.id

      # Sort the user_test_questions into three testlets, tally the correct and wrong answers
      @user_test.user_test_questions.each_with_index do |utq, index|
        case index
          when 0...@qpt then @testlet1 << utq
          when @qpt...(@qpt*2) then @testlet2 << utq
          when (@qpt*2)...(@qpt*3) then @testlet3 << utq
        end
      
        if utq.answered_correct != nil
          utq.answered_correct? ? @correct_answers +=1 : @wrong_answers +=1
        end
        
        # When the utq id matches the id of the active question, set the instance variable equal to it
        if utq.id == active_id
          @activeQuestionOnLoad = index+1
        end  
      
      end # do
      
      case @activeQuestionOnLoad
        when 1..@qpt then @currentTestlet = 1
        when (@qpt+1)..(@qpt*2) then @currentTestlet = 2
        when (@qpt*2+1)..(@qpt*3) then @currentTestlet = 3
      end
       
    end # if   
    
  end
  
  def update # POST /user_test/:question_number
    user = User.find(session[:user_id])
    
    # Get the question_number, and boolean answered value
    @question_number = (params[:question_number].to_i)
    @answered = params[:answer] == "correct" ? true : false
    
    # Find that question number in the database, and either save it as correct(true) or wrong(false)
    utq = UserTestQuestion.where(:user_test_id => user.active_test).order("id asc").offset(@question_number-1).limit(1).first
    qpt = utq.section.questions_per_testlet
    utq.answered_correct = @answered
    utq.save
    
    nextQuestionObject = UserTest.find(user.active_test).user_test_questions.where(:answered_correct => nil).order("id asc").first
    if nextQuestionObject
      @nextQuestion = UserTest.find(user.active_test).user_test_questions.order("id asc").index(nextQuestionObject) + 1      
      @endTestlet = (@nextQuestion-1) % qpt == 0 ? true : false; 
      @value = (@nextQuestion-1) / qpt
    else
      render :js => "window.location = '/user_test/finish'"
      return
    end    
    
    respond_to do |format|
      format.js
      format.html 
    end
    
  end
  
  def store_time # PUT /user_test
    if params[:time_remaining].present?
      user = User.find(session[:user_id])
      user_test = UserTest.find(user.active_test)
      user_test.time_remaining = params[:time_remaining]
      user_test.save
    end  
  end  
  
  def finish # GET /user_test/finish
    
    @user = User.find(session[:user_id])
    
    # Grade the test
    user_test = UserTest.find(@user.active_test)
    @utq = user_test.user_test_questions.order('id asc')
    @score = 0
      @utq.each do |answered_question|
        answered_question.answered_correct? ? @score += 1 : @score += 0;
      end
    
    # Score the test based on the grade
    @score = (@score.to_f / (@utq.first.user_test.section.questions_per_testlet * 3)*100).roundup(1).to_i
    
    # Save the score to the database
    user_test.score = @score
    user_test.save
    
    @user.active_test = nil
    @user.save
  end
  
end
