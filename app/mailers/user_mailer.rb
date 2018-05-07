class UserMailer < ApplicationMailer
  default from: "eramirez4369@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'eramirez4369@gmail.com',
           subject: "A new contact form message from #{name}")
  end

  def welcome_new_user(user)
    @user = user
    mail(from: email,
         to: user.email,
         subject: "Thank you for signing up!")
  end

  def place_order(user, product)
    @user = user
    @product = product
    mail(from: email,
         to: user.email,
         subject: "Thank you, for your order. Below is an order confirmation for #{product.name}.")
  end
end
