class SessionsController < ApplicationController

	def create
 	 shopper = Shopper.find_by(email: params[:login][:email])

	 if params[:login][:email] == ""
	 	redirect_to login_path, notice: 'Email cannot be null'
	 elsif params[:login][:password] == ""
	 	redirect_to login_path, notice: 'Password cannot be null'
	 elsif shopper.nil?
	 	redirect_to login_path, notice: 'User not found'
	 elsif params[:login][:password] != shopper.crpw
	 	redirect_to login_path, notice: 'Invalid credentials'
	 elsif shopper.crpw == params[:login][:password]
	 	session[:shopper_id] = shopper.id

        old_cart = LineItem.where(["shopper_id = ? AND status = ?", current_shopper.id, "unpaid" ])
        new_cart = LineItem.where(["cart_id = ?", @current_cart.id ])

        if new_cart.present?
          new_cart.update_all(shopper_id: current_shopper.id)
        end

        if old_cart.present?
          old_cart.update_all(cart_id: @current_cart.id)
        end


=begin          old_cart.each do |obj_o|
          	new_cart.each do |obj_n|
          		if obj_o.product_id == obj_n.product_id
          			obj_o.quantity = obj_o.quantity + obj_n.quantity
          			obj_o.save
          			obj_n.destroy
          		end
      		end
          end
=end

        cart_now = LineItem.where(["shopper_id = ? AND status = ?", current_shopper.id, "unpaid" ])

        if cart_now.present?
        	redirect_to '/line_items', notice: 'Logged in'
        else
        	redirect_to '/products', notice: 'Logged in'
        end
	 	
	 end

	end

	def new
		
	end

	def destroy
		session[:shopper_id] = nil
		session[:cart_id] = nil
		redirect_to root_path, notice: "Logged out"
	end

	private
	# def login_params
	# 	params.require[:login].permit[:email, :password]
	# end
end
