class TasksController < ApplicationController
  PER = 8

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to task_path(@task.id), notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  # def index
  #   binding.irb
  #   @tasks = Task.all.order(created_at: :desc)
  #   @tasks = @tasks.where(user_id: current_user)
  #   if params[:sort_expired]
  #     @tasks = @tasks.order(expired_at: :desc)
  #   elsif params[:sort_priority]
  #     @tasks = @tasks.order(priority: :asc)
  #   else
  #     if params[:search1].present? && params[:search2].present?
  #       @tasks = @tasks.where('name LIKE ?', "%#{params[:search1]}%")
  #     else
  #       @tasks = @tasks.where('name LIKE ?', "%#{params[:search1]}%") if params[:search1].present?
  #       @tasks = @tasks.where(status: params[:search2]) if params[:search2].present?
  #     end
  #   end
  #   @tasks = @tasks.page(params[:page]).per(PER)
  # end

  def index
      if params[:sort_expired]
        @tasks = Task.all.order(expired_at: :desc).where(user_id:current_user)
      elsif params[:sort_priority]
        @tasks = Task.all.order(priority: :asc).where(user_id:current_user)
      else
        @tasks = Task.all.order(created_at: :desc).where(user_id:current_user)
        if params[:search1].present? && params[:search2].present?
          @tasks = @tasks.where('name LIKE ?', "%#{params[:search1]}%").where(user_id:current_user)
        else
          @tasks = @tasks.where('name LIKE ?', "%#{params[:search1]}%").where(user_id:current_user) if params[:search1].present?
          @tasks = @tasks.where(status: params[:search2]).where(user_id:current_user) if params[:search2].present?
        end
      end
      @tasks = @tasks.page(params[:page]).per(PER)
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
    params.require(:task).permit(:name, :content, :expired_at, :status, :priority, :user_id)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
