class UsersController < ApplicationController 
  
  def new
    @user = User.new
  end

  def index; end

  def show
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update user_params
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :password, :email, :address, :phone
  end
end
