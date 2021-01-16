class Admin::SessionsController < ApplicationController

	def create
		admin = Admin::NAdmin.find_by(email: params[:login][:email])

		if params[:login][:email] == ""
			redirect_to admin_login_path, notice: 'Email cannot be null'
		elsif params[:login][:password] == ""
			redirect_to admin_login_path, notice: 'Password cannot be null'
		elsif admin.nil?
			redirect_to admin_login_path, notice: 'User not found'
		elsif params[:login][:password] != admin.crpw
			redirect_to admin_login_path, notice: 'Invalid credentials'
		elsif admin.crpw == params[:login][:password]
			session[:admin_id] = admin.id
			redirect_to admin_products_path, notice: 'Logged in'
        end

	end # /create

	def new
		
	end # /new

	def destroy
		session[:admin_id] = nil
		redirect_to admin_login_path, notice: "Logged out"
	end # /destroy
end
