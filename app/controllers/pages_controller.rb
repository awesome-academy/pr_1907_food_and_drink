class PagesController < ApplicationController 
  def home
    @products = Product.get_random_products_for_home_page
    @categories = Category.all
  end

  def gallery
    @products = Product.all
  end

  def about; end

  def revervation; end
end
