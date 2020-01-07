class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:edit, :show]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save 
      flash[:success]  = t(".create_user")
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t(".update_user")
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  def destroy
    @user = User.find_by id: params[:id] 
    @user.destroy
    redirect_to admin_users_path
  end

  private 
  def user_params
    params.require(:user).permit :name, :email, :address, :phone, :password, :role
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end
end
