class PagesController < ApplicationController 
  def home
    @products = Product.get_random_products_for_home_page
    @categories = Category.all
    @order_item = current_order.order_items.new
  end

  def gallery
    @products = Product.all
  end

  def about; end

  def revervation; end
end
