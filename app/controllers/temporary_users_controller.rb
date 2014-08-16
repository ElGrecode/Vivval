class TemporaryUsersController < ApplicationController
  def lander
    @temporary_user = TemporaryUser.new
  end

  def signIn
    @user = User.new
  end 

  def index

  end

end