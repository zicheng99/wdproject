class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_customer!, except: [:index, :show]


  def check_promo
    if params['promo'] == "promo20"
        @code = "valid"
    else
        @code = "invalid"
    end
    
    respond_to do |format|
      #format.html { redirect_to cart_path(@old_cart) }
      format.js
    end
  end

  # GET /line_items
  # GET /line_items.json
  def index
    @cart = Cart.new
    if session[:shopper_id] == nil
      @line_items = LineItem.where(["cart_id = ? and status = ?", @current_cart.id, "unpaid" ])
      #@line_items = LineItem.all.order(created_at: :desc)
      @line_item = LineItem.new
    else
      #@line_items = LineItem.all.order(created_at: :desc)
      @line_items = LineItem.where(["cart_id = ? ", @current_cart.id ]).order(created_at: :desc)
      @line_item = LineItem.new
    end

  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create

    #s = LineItem.where(["product_id = ? and cart_id = ?", line_item_params[:product_id], @current_cart.id])
    # User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
    # SELECT * FROM users WHERE name = 'Joe' AND email = 'joe@example.com';

    s = LineItem.where(["product_id = ? and cart_id = ?", line_item_params[:product_id], @current_cart.id]).first
    @line_item = LineItem.new(line_item_params)

    if current_shopper
      @line_item.shopper_id = @current_shopper.id
    else
      @line_item.shopper_id = 1
    end

    if s.present?
        # s.status = "qty updated"
        s.quantity = s.quantity + line_item_params[:quantity].to_i
        s.subtotal = s.quantity * s.product.unit_price
        s.save

      respond_to do |format|
        format.html { redirect_to line_items_path, notice: 'Product was successfully added.'}
      end

    else
      @line_item.status = "unpaid"
      @line_item.cart_id = @current_cart.id
      @product = Product.find(line_item_params[:product_id])
      @line_item.subtotal = @line_item.quantity * @product.unit_price.to_i

      if@line_item.save
        respond_to do |format|
          format.html { redirect_to line_items_path, notice: 'Product was successfully added.'}
        end
      end
    end

  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update

    respond_to do |format|
      if @line_item.update(line_item_params)
        @line_items = LineItem.where(["shopper_id = ? and status = ?", current_shopper.id, "unpaid" ]).order(created_at: :desc)
        
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated. (From def update)' }
        format.json { render :show, status: :ok, location: @line_item }
        format.js
      else
        format.html { render :edit, notice: 'Line item was updated failed. (From def update)'}
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Cart item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end



end
