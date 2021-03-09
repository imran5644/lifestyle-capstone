# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all.order(:name)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User successfully updated'
    else
      redirect_to edit_user_path(@user), notice: 'An error ocurred while updating this user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
