class TopicsController < ApplicationController
  
  def show
    @topics = params[:topics]
    @questions = []
    @topics.each do |code|
      @questions << Topic.questions_from_code(code)
    end
    
    @questions.flatten!
    @questions.shuffle!
  end  
  
  def question
    if params[:question].present?
      @question = Question.find(params[:question])
      
      render json: { question: @question, answers: @question.answers, topic: @question.topic }
    end
  end
  
end