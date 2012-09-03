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
  
  
end