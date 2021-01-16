class Admin::PromocodesController < ApplicationController
  before_action :set_admin_promocode, only: [:show, :edit, :update, :destroy]

  # GET /admin/promocodes
  # GET /admin/promocodes.json
  def index
    @admin_promocodes = Admin::Promocode.all
  end

  # GET /admin/promocodes/1
  # GET /admin/promocodes/1.json
  def show
  end

  # GET /admin/promocodes/new
  def new
    @admin_promocode = Admin::Promocode.new
  end

  # GET /admin/promocodes/1/edit
  def edit
  end

  # POST /admin/promocodes
  # POST /admin/promocodes.json
  def create
    @admin_promocode = Admin::Promocode.new(admin_promocode_params)

    respond_to do |format|
      if @admin_promocode.save
        format.html { redirect_to admin_promocodes_path , notice: 'Promocode was successfully created.' }
        format.json { render :show, status: :created, location: @admin_promocode }
      else
        format.html { render :new }
        format.json { render json: @admin_promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/promocodes/1
  # PATCH/PUT /admin/promocodes/1.json
  def update
    respond_to do |format|
      if @admin_promocode.update(admin_promocode_params)
        format.html { redirect_to @admin_promocode, notice: 'Promocode was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_promocode }
      else
        format.html { render :edit }
        format.json { render json: @admin_promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/promocodes/1
  # DELETE /admin/promocodes/1.json
  def destroy
    @admin_promocode.destroy
    respond_to do |format|
      format.html { redirect_to admin_promocodes_url, notice: 'Promocode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_promocode
      @admin_promocode = Admin::Promocode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_promocode_params
      params.require(:admin_promocode).permit(:name, :start, :end, :discount_type, :value)
    end
end
