class Admin::OrdersController < ApplicationController

  def index
    @carts = Cart.all.order(created_at: :desc)
  end

  def show
    @line_items = LineItem.where(["cart_id = ?", params[:id] ])
  end

  def make_order
    @old_cart = @current_cart.id
    @line_items = LineItem.where(["customer_id = ? and status = ?", current_customer.id, "unpaid" ])

    sum = 0
    @line_items.each do |line_item|
      sum = sum + (line_item.quantity * line_item.product.unit_price)
    end

    @current_cart.total = sum
    @current_cart.customer_id = current_customer.id
    @current_cart.save

    LineItem.where(["customer_id = ? ", current_customer.id ]).update_all(status: 'paid')


    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id

    respond_to do |format|
      format.html { redirect_to cart_path(@old_cart) }
       # format.js
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    #Cart.destroy_all
    #LineItem.destroy_all
    redirect_to carts_path
  end
end
