class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by_username(params[:username])
    
    if @user
      cookies[:user_id] = @user.id
      redirect_to "/user/#{@user.id}"
    else
      @flash = "Error: Username could not be found"
      render 'new'
    end
    
  end
  
  def destroy
    cookies.delete :user_id
    redirect_to '/'
  end
  
end