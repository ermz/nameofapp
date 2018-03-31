class SimplePagesController < ApplicationController
  def index
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
      to: 'eramirez4369@gmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end

  def landing_page
    @products = Product.limit(3)
    @data_slide_num = 0
  end

  private
end
