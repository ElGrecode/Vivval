class TemporaryUsersController < ApplicationController
  def lander
    @temporary_user = TemporaryUser.new
  end

  def success

  end

  # todo: unused right now, must figure out a way to integrate using sessions
  def signIn
    @user = User.new
  end 

  def index

  end

  # Creates a temporary web page or a page that accepts random token
  # Sends a email to an entered email address
  # In the email would be the temporarily created register page

  def create
    @temporary_user = TemporaryUser.new(params.require(:temporary_user).permit(:email))
    if @temporary_user.save
      # todo: create a temporary page or generate a random token
      # todo: send an email
      redirect_to success_path
    else
      # render :lander
    end
  end

end