class SimplePagesController < ApplicationController

  include ActiveModel::Validations

  validates :name, presence: true
  validates :email, presence: true
  validates :messages, presence: true

  def index
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def landing_page
    @products = Product.limit(3)
    @data_slide_num = 0
  end

  private
end
