class Admin::NAdminsController < ApplicationController
  before_action :set_admin_n_admin, only: [:show, :edit, :update, :destroy]

  # GET /admin/n_admins
  # GET /admin/n_admins.json
  def index
    @admin_n_admins = Admin::NAdmin.all
  end

  # GET /admin/n_admins/1
  # GET /admin/n_admins/1.json
  def show
  end

  # GET /admin/n_admins/new
  def new
    @admin_n_admin = Admin::NAdmin.new
  end

  # GET /admin/n_admins/1/edit
  def edit
  end

  # POST /admin/n_admins
  # POST /admin/n_admins.json
  def create
    @admin_n_admin = Admin::NAdmin.new(admin_n_admin_params)

    respond_to do |format|
      if @admin_n_admin.save
        format.html { redirect_to @admin_n_admin, notice: 'N admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin_n_admin }
      else
        format.html { render :new }
        format.json { render json: @admin_n_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/n_admins/1
  # PATCH/PUT /admin/n_admins/1.json
  def update
    respond_to do |format|
      if @admin_n_admin.update(admin_n_admin_params)
        format.html { redirect_to @admin_n_admin, notice: 'N admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_n_admin }
      else
        format.html { render :edit }
        format.json { render json: @admin_n_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/n_admins/1
  # DELETE /admin/n_admins/1.json
  def destroy
    @admin_n_admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_n_admins_url, notice: 'N admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_n_admin
      @admin_n_admin = Admin::NAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_n_admin_params
      params.require(:admin_n_admin).permit(:email, :crpw)
    end
end
