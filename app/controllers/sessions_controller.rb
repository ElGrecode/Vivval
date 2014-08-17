class SessionsController < ApplicationController

  def create
    # Find the user that is trying to log in
    u = User.where(email: params[:user][:email]).first
    # If we do have that user
    if u && u.authenticate(params[:user][:password])
      # Store as a cookie in the users' browser the ID of them
      # Indicating that they are logged in
      session[:user_uuid] = u.uuid.to_s
      redirect_to user_home_path
    else
      # Go back to the login page
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to user_home_path
  end
end
