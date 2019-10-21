class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.where("1=1")
    @products = @products.where("material_name like ?",  "%#{params[:material_name]}%") if params[:material_name]
    @products = @products.where("material_type like ?",  "%#{params[:material_type]}%") if params[:material_type]
    @products = @products.where("material_code like ?",  "%#{params[:material_code]}%") if params[:material_code]
    @products = @products.where("specs like ?",  "%#{params[:specs]}%") if params[:specs]
    @products = @products.order(:id).page(params[:page]).per 5
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.user_id = session[:user_id]

    if @product.save
      params[:productMaterial].each_with_index  do |x,index|
        productItem = ProductItem.new(product_id: @product.id, material_id: x, num: params[:productMaterialNum][index])
        productItem.save
      end
      redirect_to @product, notice: '产品创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      @product.productItems.each {|item| item.destroy}
      params[:productMaterial].each_with_index  do |x,index|
        productItem = ProductItem.new(product_id: @product.id, material_id: x, num: params[:productMaterialNum][index])
        productItem.save
      end
      redirect_to @product, notice: '产品更新成功'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: '产品删除成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit( :material_type, :material_code, :material_name, :specs, :unit, :brand, :num, :supplier, :remark)
    end
end
