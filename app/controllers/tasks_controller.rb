class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.create(name: params[:task][:name], description: params[:task][:description], list_id: params[:task][:list_id], list_position: params[:task][:list_position])
    if @task.valid?
      redirect_to tasks_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.permit(:name, :position))
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
    end
  end
end
