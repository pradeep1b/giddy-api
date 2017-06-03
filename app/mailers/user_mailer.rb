class UserMailer < ApplicationMailer
  default from: 'no-reply@giddy.bike'

  def registration_confirmation(user)
    @user = user
    @web_app_url = Rails.application.secrets.web_app_url
    mail(to: "#{user.name} <#{user.email}>", subject: 'Registration Confirmation')
  end
end
