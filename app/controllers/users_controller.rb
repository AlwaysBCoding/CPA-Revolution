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
        session[:user_id] = @user.id
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
    @user_tests = UserTest.where(:user_id => @user.id)
    @sections = Section.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end
  
  def scoredate # POST /users/:id
    @user = User.find(session[:user_id])
    
    # Set the USER exam_date equal to the date that comes through on the form
    if params[:exam_date].present?
      case params[:section]
        when "FAR"
          @user.far_date = params[:exam_date]; @user.save
        when "REG"
          @user.reg_date = params[:exam_date]; @user.save
        when "BEC"
          @user.bec_date = params[:exam_date]; @user.save
        when "AUD"
          @user.aud_date = params[:exam_date]; @user.save
      end
    end        
    
    # Set the USER exam_score equal to the score that comes through on the form
    if params[:exam_score].present?
      case params[:section]
        when "FAR"
          @user.far_score = params[:exam_score]; @user.save
        when "REG"
          @user.reg_score = params[:exam_score]; @user.save
        when "BEC"  
          @user.bec_score = params[:exam_score]; @user.save
        when "AUD"  
          @user.aud_score = params[:exam_score]; @user.save
      end
    end    
    
    redirect_to "/users/#{@user.id}"
  end
  
  
end