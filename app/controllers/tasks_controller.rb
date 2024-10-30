class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:edit, :update, :destroy]

  def edit
  end

  def index
    @tasks = @list.tasks.order(:list_position)
  end

  def create
    @task = @list.tasks.build(name: params[:task][:name], description: params[:task][:description],list_position: params[:task][:list_position])
    if @task.save
      redirect_to list_tasks_path(@list)
    end
  end

  def update
    if @task.update(task_params)
      redirect_to list_tasks_path(@list)
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list)
  end

  def task_params
    params.require(:task).permit(:name, :description, :list_position)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to lists_path
  end
end
