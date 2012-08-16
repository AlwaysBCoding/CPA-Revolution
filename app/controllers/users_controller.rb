class UsersController < ApplicationController
  
  def show
    @user = User.find_by_id(cookies[:user_id])
  end
  
  
end