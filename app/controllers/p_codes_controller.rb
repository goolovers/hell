class PCodesController < ApplicationController
  before_action :set_p_code, only: [:show, :edit, :update, :destroy]

  # GET /p_codes
  def index
    @p_codes = PCode.where("1=1")
    @p_codes = PCode.where(["type_code like ? ", "%#{params[:type_code]}%"]) unless params[:type_code].blank?
    @p_codes = @p_codes.order("id desc").page(params[:page]).per 10
  end

  # GET /p_codes/1
  def show
  end

  # GET /p_codes/new
  def new
    @p_code = PCode.new
  end

  # GET /p_codes/1/edit
  def edit
  end

  # POST /p_codes
  def create
    @p_code = PCode.new(p_code_params)

    if @p_code.save
      redirect_to @p_code, notice: '创建码值成功！.'
    else
      render :new
    end
  end

  # PATCH/PUT /p_codes/1
  def update
    if @p_code.update(p_code_params)
      redirect_to @p_code, notice: '码值更新成功.'
    else
      render :edit
    end
  end

  # DELETE /p_codes/1
  def destroy
    @p_code.destroy
    redirect_to p_codes_url, notice: '码值已删除！'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_p_code
      @p_code = PCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def p_code_params
      params.require(:p_code).permit(:type_code, :code, :name)
    end
end
