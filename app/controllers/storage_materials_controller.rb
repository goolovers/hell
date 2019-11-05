class StorageMaterialsController < ApplicationController
  before_action :set_storage_material, only: [:show, :edit, :update, :destroy]

  # GET /storage_materials
  def index
    @storage_materials = StorageMaterial.where("1=1")
    @storage_materials = @storage_materials.joins(:material).where("materials.material_name like ?",  "%#{params[:material_name]}%") unless params[:material_name].blank?
    @storage_materials = @storage_materials.joins(:material).where("materials.material_type like ?",  "%#{params[:material_type]}%") unless params[:material_type].blank?
    @storage_materials = @storage_materials.joins(:material).where("materials.material_code like ?",  "%#{params[:material_code]}%") unless params[:material_code].blank?
    @storage_materials = @storage_materials.joins(:material).where("materials.specs like ?",  "%#{params[:specs]}%") unless params[:specs].blank?
    @storage_materials = @storage_materials.joins(:material).order("(storage_materials.num-materials.lower_num) asc").page(params[:page]).per 10
  end

  # GET /storage_materials/1
  def show
  end

  # GET /storage_materials/new
  def new
    @storage_material = StorageMaterial.new
  end

  # GET /storage_materials/1/edit
  def edit
  end

  # POST /storage_materials
  def create
    @storage_material = StorageMaterial.new(storage_material_params)

    if @storage_material.save
      redirect_to @storage_material, notice: 'Storage material was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /storage_materials/1
  def update
    if @storage_material.update(storage_material_params)
      redirect_to @storage_material, notice: 'Storage material was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /storage_materials/1
  def destroy
    @storage_material.destroy
    redirect_to storage_materials_url, notice: 'Storage material was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_material
      @storage_material = StorageMaterial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def storage_material_params
      params.require(:storage_material).permit(:num, :material_id)
    end
end
