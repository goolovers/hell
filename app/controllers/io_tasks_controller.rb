class IoTasksController < ApplicationController
  before_action :set_io_task, only: [:show, :edit, :update, :destroy]

  # GET /io_tasks
  def index
    @io_tasks = IoTask.where("1=1")
    @io_tasks = IoTask.where(io_type: params[:io_type]) unless params[:io_type].blank?
    @io_tasks = IoTask.where(io_reason: params[:io_reason]) unless params[:io_reason].blank?
    @io_tasks = IoTask.where(status: params[:status]) unless params[:status].blank?
    @io_tasks = @io_tasks.order("id desc").page(params[:page]).per 10
  end

  # GET /io_tasks/1
  def show
  end

  # GET /io_tasks/new
  def new
    @io_task = IoTask.new
    @io_task.io_type = params[:io_type]
  end

  # GET /io_tasks/1/edit
  def edit
  end

  # POST /io_tasks
  def create
    @io_task = IoTask.new(io_task_params)

    if @io_task.save
      redirect_to @io_task, notice: 'Io task was successfully created.'
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
    redirect_to io_tasks_url, notice: 'Io task was successfully destroyed.'
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
