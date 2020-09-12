class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def index
    @tasks = Task.all
  end

  def show
  end
  def update
    if @task.update(task_params)
      redirect_to task_path(@task.id), notice: "編集しました"
    else
      render :edit
    end
  end
  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:name, :content)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
