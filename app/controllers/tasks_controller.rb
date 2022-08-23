class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @result = @task.completed ? 'This task is completed' : 'This task is not completed.'
  end

  def new
    # why there are 2 Task.new?
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  # To avoid the ActiveModel::ForbiddenAttributesError
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
