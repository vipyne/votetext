class UsersController < ApplicationController

  def index

  end

  def create
    @user = User.create params[:user]
    if @user.present?
      login @user
      send_message "temp hardcoded message"
      redirect_to user_path @user
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.last
  end

end