class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
    
  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1     
  end  

  def index
    @count = increment_counter
    @products  = Product.all
    @shown_message = "You've been here #{@count} times"
  end
end
