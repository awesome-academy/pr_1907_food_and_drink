class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  
  helper_method :current_order 

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    elsif current_user 
      current_user.orders.new status: 0
    else
      Order.new
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, 
      :password, :password_confirmation, :remember_me) } 
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, 
      :password, :remember_me) } 
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, 
      :email, :phone, :address, :password, :password_confirmation, 
      :current_password  )} 
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options
    {locale: I18n.locale}
  end
end
