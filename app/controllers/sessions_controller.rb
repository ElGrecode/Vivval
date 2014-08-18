class SessionsController < ApplicationController

  def create
    # Find a user based on entered email address
    u = User.where(email: params[:user][:email]).first

    if u && u.authenticate(params[:user][:password])
      # Store as a cookie in the users' browser with unique ID identifying them
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
