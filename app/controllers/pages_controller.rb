class PagesController < ApplicationController 
  def home; end

  def gallery
    @products = Product.all
  end
end
