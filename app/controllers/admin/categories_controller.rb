class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by id: params[:id]
    @products = @category.products
    redirect_to root_path unless @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save 
      flash[:success] = t(".create_category")
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by id: params[:id]
    redirect_to root_path unless @category
  end

  def update
    @category = Category.find_by id: params[:id]
    if @category.update_attributes category_params
      flash[:success] = t(".update_category")
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find_by id: params[:id]
    @category.destroy
    redirect_to admin_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit :name
  end
end
