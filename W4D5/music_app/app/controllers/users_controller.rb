class UsersController < ApplicationController

  #Goes to sign up user page
  def new
    render :new
  end

  #Saves the user instance in the database
  def create
    user = User.new(user_params)
    
    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  #Shows the user page, just email for now
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
