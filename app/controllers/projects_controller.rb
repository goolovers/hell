class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.where("1=1")
    @projects = Project.where("name like ?", "%#{params[:query_name]}%") unless params[:query_name].blank?
    @projects = @projects.order("id desc").page(params[:page]).per 10
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    if @project.save
      params[:projectMaterial].each_with_index  do |x,index|
        material = ProjectMaterial.new(project_id: @project.id, material_id: x, need_num: params[:projectMaterialNum][index])
        material.save
      end
      params[:projectProduct].each_with_index  do |x,index|
        product = ProjectProduct.new(project_id: @project.id, product_id: x, need_num: params[:projectProductNum][index])
        product.save
      end
      redirect_to @project, notice: '项目创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      @project.projectMaterials.each {|item| item.destroy}
      params[:projectMaterial].each_with_index  do |x,index|
        material = ProjectMaterial.new(project_id: @project.id, material_id: x, need_num: params[:projectMaterialNum][index])
        material.save
      end

      @project.projectProducts.each {|item| item.destroy}
      params[:projectProduct].each_with_index  do |x,index|
        product = ProjectProduct.new(project_id: @project.id, product_id: x, need_num: params[:projectProductNum][index])
        product.save
      end
      redirect_to @project, notice: '项目更新成功！'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: '项目删除成功！'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :status, :plan_start_time, :plan_end_time, :start_time, :end_time, :charge)
    end
end
