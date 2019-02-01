class SessionsController < ApplicationController

  #Goes to log-in page
  def new
    render :new
  end

  #Creates the correct session token for user
  def create
    user = User.find_by_credentials(session_params)

    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
      render :new
    end
  end

  #Kills the session by logging out and deleting session token
  def destroy
    log_out_user!
    render :new
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
