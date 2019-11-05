# 原材料档案
class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.where("1=1")
    @materials = @materials.where("material_name like ?",  "%#{params[:material_name]}%") unless params[:material_name].blank?
    @materials = @materials.where("material_type like ?",  "%#{params[:material_type]}%") unless params[:material_type].blank?
    @materials = @materials.where("material_code like ?",  "%#{params[:material_code]}%") unless params[:material_code].blank?
    @materials = @materials.where("specs like ?",  "%#{params[:specs]}%") unless params[:specs].blank?
    @materials = @materials.order("id desc").page(params[:page]).per 10
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    @material.user_id = session[:user_id]
    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: '创建原材料档案成功！' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: '更新原材料档案成功！' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: '删除原材料档案成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:material_type, :material_code, :material_name, :specs, :unit, :brand, :num, :supplier, :tax_rate, :before_tax, :after_tax, :remark)
    end
end
