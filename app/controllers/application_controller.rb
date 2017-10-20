class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def current_cart
    @cart_id = Cart.find_by id: session[:cart_id]
    if @cart_id.blank?
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    else
      Cart.find_by id: session[:cart_id]
    end
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "ple_login"
    redirect_to login_url
  end
end
