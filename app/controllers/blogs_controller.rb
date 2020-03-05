class BlogsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find_by id: params[:id]
    if @product.reviews.blank? 
      @average_review = 0
    else
      @average_review  = @product.reviews.average(:rating).round(2)
    end
   
  end
end
