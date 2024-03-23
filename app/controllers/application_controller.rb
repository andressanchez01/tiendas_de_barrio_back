class ApplicationController < ActionController::Base
  before_action :set_current_cart, :configure_permitted_parameters, if: :devise_controller?

  def set_current_cart
    if user_signed_in?
      # Usuario autenticado
      @current_cart = current_user.cart || current_user.create_cart
    else
      # Usuario no autenticado
      @current_cart = current_cart
    end
    session[:cart_id] = @current_cart.id
  end

  private

  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

  def set_user
    @user = current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address, :fiscal_number, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address, :fiscal_number, :role])
  end
end
