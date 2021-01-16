class CartsController < ApplicationController

  def index
    #@carts = Cart.all
    @carts = Cart.where(["shopper_id = ?", current_shopper.id ]).order(created_at: :desc)
  end

  def show
    @line_items = LineItem.where(["cart_id = ?", params[:id] ])
    @cart = Cart.find(params['id'])
  end
  
  def make_order
    @old_cart = @current_cart.id
    @line_items = LineItem.where(["shopper_id = ? and status = ?", current_shopper.id, "unpaid" ])

    @sum = 0
    @line_items.each do |line_item|
      if line_item.product.discount > 0 
        @sum = @sum + (line_item.quantity * line_item.product.unit_price-((line_item.product.discount/100)*line_item.product.unit_price))
      else
        @sum = @sum + (line_item.quantity * line_item.product.unit_price)
      end
    end

    @current_cart.total = @sum + 10 - 20
    @current_cart.shopper_id = current_shopper.id
    @current_cart.save

    LineItem.where(["shopper_id = ? ", current_shopper.id ]).update_all(status: 'paid')


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
    redirect_to admin_carts_path
  end
end
