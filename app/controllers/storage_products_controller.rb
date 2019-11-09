class StorageProductsController < ApplicationController
  before_action :set_storage_product, only: [:show, :edit, :update, :destroy]

  # GET /storage_products
  # GET /storage_products.json
  def index
    @storage_products = StorageProduct.where("1=1")
    @storage_products = @storage_products.joins(:product).where("products.material_name like ?",  "%#{params[:material_name]}%") unless params[:material_name].blank?
    @storage_products = @storage_products.joins(:product).where("products.material_type like ?",  "%#{params[:material_type]}%") unless params[:material_type].blank?
    @storage_products = @storage_products.joins(:product).where("products.material_code like ?",  "%#{params[:material_code]}%") unless params[:material_code].blank?
    @storage_products = @storage_products.joins(:product).where("products.specs like ?",  "%#{params[:specs]}%") unless params[:specs].blank?
    @storage_products = @storage_products.joins(:product).order("(storage_products.num-products.lower_num) asc").page(params[:page]).per 10
  end

  # GET /storage_products/1
  # GET /storage_products/1.json
  def show
  end

  # GET /storage_products/new
  def new
    @storage_product = StorageProduct.new
  end

  # GET /storage_products/1/edit
  def edit
  end

  # POST /storage_products
  # POST /storage_products.json
  def create
    @storage_product = StorageProduct.new(storage_product_params)

    respond_to do |format|
      if @storage_product.save
        format.html { redirect_to @storage_product, notice: 'Storage product was successfully created.' }
        format.json { render :show, status: :created, location: @storage_product }
      else
        format.html { render :new }
        format.json { render json: @storage_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_products/1
  # PATCH/PUT /storage_products/1.json
  def update
    respond_to do |format|
      if @storage_product.update(storage_product_params)
        format.html { redirect_to @storage_product, notice: 'Storage product was successfully updated.' }
        format.json { render :show, status: :ok, location: @storage_product }
      else
        format.html { render :edit }
        format.json { render json: @storage_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_products/1
  # DELETE /storage_products/1.json
  def destroy
    @storage_product.destroy
    respond_to do |format|
      format.html { redirect_to storage_products_url, notice: 'Storage product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_product
      @storage_product = StorageProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_product_params
      params.require(:storage_product).permit(:num, :product_id)
    end
end
