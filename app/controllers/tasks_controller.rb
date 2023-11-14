# frozen_string_literal: true

# TasksController handles the CRUD operations for tasks in the application.
# It interacts with the Task model to retrieve and manipulate task data.
# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    # The set_task before_action ensures @task is set correctly.
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The set_task before_action ensures @task is set correctly.
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path, alert: 'Task not found' unless @task
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
