class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only: [:edit, :show]
 
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t(".create_product")
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    @product = Product.find_by id: params[:id]
    if @product.update_attributes product_params
      flash[:success] = t(".update_product")
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by id: params[:id]
    @product.destroy
    redirect_to admin_products_path
  end
 
  private
  def product_params
    params.require(:product).permit :picture, :name, :price, :description,
      :status, :category_id
  end

  def find_product
    @product = Product.find_by id: params[:id]
    redirect_to root_path unless @product
  end
end
