class Admin::ShoppersController < ApplicationController
  before_action :set_shopper, only: [:show, :edit, :update, :destroy]

  # GET /shoppers
  # GET /shoppers.json
  def index
    @shoppers = Shopper.all
  end

  # GET /shoppers/1
  # GET /shoppers/1.json
  def show
  end

  # GET /shoppers/new
  def new
    @shopper = Shopper.new
  end

  # GET /shoppers/1/edit
  def edit
  end

  # POST /shoppers
  # POST /shoppers.json
  def create
    @shopper = Shopper.new(shopper_params)

    respond_to do |format|
      if @shopper.save
        session[:shopper_id] = @shopper.id
        format.html { redirect_to root_path, notice: 'Shopper was successfully created.' }
        format.json { render :show, status: :created, location: @shopper }
      else
        format.html { render :new }
        format.json { render json: @shopper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppers/1
  # PATCH/PUT /shoppers/1.json
  def update
    respond_to do |format|
      if @shopper.update(shopper_params)
        format.html { redirect_to admin_shoppers_path, notice: 'Shopper was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopper }
      else
        format.html { render :edit }
        format.json { render json: @shopper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppers/1
  # DELETE /shoppers/1.json
  def destroy
    @shopper.destroy
    respond_to do |format|
      format.html { redirect_to admin_shoppers_path, notice: 'Shopper was successfully destroyed. (Admin)' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopper
      @shopper = Shopper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopper_params
      params.require(:shopper).permit(:email, :address, :name, :crpw, :npw, :cfpw)
    end
end
