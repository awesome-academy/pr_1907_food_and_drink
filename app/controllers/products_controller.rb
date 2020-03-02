class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find id: params[:id]
  end
end
