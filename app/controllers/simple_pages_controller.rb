class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @products = Product.limit(3)
    @data_slide_num = 0
  end

  private
end
