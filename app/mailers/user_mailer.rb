# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def send_welcome_mail(user)
    mail(to: user.email, subject: 'Welcome to Venue!')
  end
end
