class Admin::UsersController < ApplicationController
  def index
    @users = User.select(:id, :name, :email).order(id: :asc)
  end
end
