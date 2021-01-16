class ApplicationController < ActionController::Base
before_action :current_cart
before_action :move_cart_if_present
helper_method :current_shopper
helper_method :current_cart
helper_method :current_admin

    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end

    def move_cart_if_present
      if session[:test]
        session[:test] = session[:test] + 1
      else
        session[:test] = 0
      end
    end

  def current_shopper
    if session[:shopper_id]
      @current_shopper ||= Shopper.find(session[:shopper_id])
    else
      @current_shopper = nil
    end
  end

  def current_admin
      if session[:admin_id]
         current_admin ||= Admin::Admin.find(session[:admin_id])
      else
         current_admin = nil
      end
  end # /current_admin

end
