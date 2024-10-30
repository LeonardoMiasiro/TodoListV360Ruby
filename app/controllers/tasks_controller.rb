class TasksController < ApplicationController

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to list_path(@list), notice: 'Task was successfully created.'
    else
      flash.now[:alert] = 'Failed to create task.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@task.list), notice: 'Task was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update task.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      redirect_to list_path(@task.list), notice: 'Task was successfully deleted.'
    else
      redirect_to list_path(@task.list), alert: 'Failed to delete task.'
    end
  end

  private

  # Strong parameters
  def task_params
    params.require(:task).permit(:name, :description, :list_position)
  end

  # Set task before update and destroy
  def set_task
    @task = Task.find(params[:id])
  end

  # Set list before creating a task
  def set_list
    @list = List.find(params[:list_id])
  end
end
