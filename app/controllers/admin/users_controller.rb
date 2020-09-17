class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.select(:id, :name, :email).order(id: :asc)
  end
  def new
      @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
    @tasks = Task.all.where(user_id: @user)
  end
  def edit
  end
  def update
    redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
