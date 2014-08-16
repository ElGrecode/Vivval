class UserMailer < ActionMailer::Base
  default from: "welcome@vivval.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.request_invite.subject
  #
  def request_invite(temp_user)
    @temporary_user = temp_user

    mail to: @temporary_user.email, subject: "Welcome to Vivval"
  end
end
