class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
    @result = @task.completed ? 'This task is completed' : 'This task is not completed.'
  end

  def new
    # Why there are 2 Task.new?
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  # To avoid the ActiveModel::ForbiddenAttributesError
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
