class UsersController < ApplicationController
  
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end
  
  
end