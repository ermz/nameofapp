class UserMailer < ApplicationMailer
  default from: "eramirez4369@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'eramirez4369@gmail.com',
           subject: "A new contact form message from #{name}")
  end

end
