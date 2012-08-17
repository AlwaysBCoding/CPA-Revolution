class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @username = params[:username]
    user = User.find_by_username(@username)
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_url(user), :notice => "Signed in as #{@username}"
    else
      flash[:notice] = "Sign in unsuccessful."
      render 'new'
    end
    
  end
  
  def destroy
    reset_session
    redirect_to root_url :notice => 'Sign-out successful'
  end
  
end