class ProjectIoTasksController < ApplicationController
  before_action :set_io_task, only: [:show, :edit, :update, :destroy, :check, :out]

  # GET /io_tasks
  def index
    @io_tasks = IoTask.where("1=1")
    @io_tasks = IoTask.where(io_type: params[:io_type]) unless params[:io_type].blank?
    @io_tasks = IoTask.where(io_reason: params[:io_reason]) unless params[:io_reason].blank?
    @io_tasks = IoTask.where(status: params[:status]) unless params[:status].blank?
    @io_tasks = @io_tasks.order("id desc").page(params[:page]).per 10
  end

  # GET /project_io_tasks/1
  def show
  end

  # GET /projectio_tasks/new
  def new
    @io_task = IoTask.new
    @io_task.io_type = params[:io_type]
    render @io_task.io_type
  end

  # GET /project_io_tasks/1/edit
  def edit
  end

  def check
    if @io_task.status == "before_examine"
      @io_task.status = "after_examine"
      @io_task.check_user_id = session[:user_id]
      @io_task.save
      redirect_to @io_task, notice: '配件出库任务审批成功！'
    else
      redirect_to @io_task, notice: '当前任务状态不符！！'
    end
  end

  def out
    if @io_task.status == "after_examine" && @io_task.io_type == 'in'
      @io_task.ioTaskDet.each do |iodet|
        storageMaterial = StorageMaterial.find_by_material_id iodet.material_id
        new_num = storageMaterial.num + iodet.num
        storageMaterial.update(num: new_num)

      end
      @io_task.update(status: "after_out")
      @io_task.update(io_at: Time.now)
      @io_task.update(exec_user_id: session[:user_id])
      redirect_to @io_task, notice: '配件入库已记录！.'
    elsif @io_task.status == "after_examine" && @io_task.io_type == 'out'

      @io_task.ioTaskDet.each do |iodet|
        storageMaterial = StorageMaterial.find_by_material_id iodet.material_id
        new_num = storageMaterial.num - iodet.num
        redirect_to @io_task, notice: '配件库存不足，无法出库！' if new_num <0
      end

      @io_task.ioTaskDet.each do |iodet|
        storageMaterial = StorageMaterial.find_by_material_id iodet.material_id
        new_num = storageMaterial.num - iodet.num
        storageMaterial.update(num: new_num)
      end
      @io_task.update(status: "after_out")
      @io_task.update(io_at: Time.now)
      @io_task.update(exec_user_id: session[:user_id])
      redirect_to @io_task, notice: '配件出库已记录！'
    else
      redirect_to @io_task, notice: '当前任务状态不符！'
    end
  end

  # POST /io_tasks
  def create
    @io_task = IoTask.new(io_task_params)
    @io_task.apply_user_id = session[:user_id]
    @io_task.status = "before_examine"
    @io_task.material_product_type = "material"

    if @io_task.save
      params[:productMaterial].each_with_index  do |x,index|
        ioTaskDet = IoTaskDet.new(io_task_id: @io_task.id, material_id: x, num: params[:productMaterialNum][index])
        ioTaskDet.save
      end
      redirect_to @io_task, notice: '配件出库任务创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /io_tasks/1
  def update
    if @io_task.update(io_task_params)
      redirect_to @io_task, notice: 'Io task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /io_tasks/1
  def destroy
    @io_task.destroy
    redirect_to project_io_tasks_url, notice: 'Io task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_io_task
      @io_task = IoTask.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def io_task_params
      params.require(:io_task).permit(:io_type, :io_reason, :io_at, :apply_user_id, :exec_user_id, :status, :material_product_type, :io_wh, :project_id)
    end
end
