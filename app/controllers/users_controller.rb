class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      session[:user_id] = @user.id
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
    redirect_to tasks_path if current_user.id != @user.id
  end
  def edit
    redirect_to tasks_path if current_user.id != @user.id
  end
  def update
    if current_user.id == @user.id && @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
