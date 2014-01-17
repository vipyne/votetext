class UsersController < ApplicationController

  def index

  end

  def create
    @user = User.create params[:user]
    @phone = '+#{@user.phonenumber}'
    send_message @phone, @user.to_s
    redirect_to user_path @user
  end

  def new
    @user = User.new
  end

  def show
    @user = User.last
  end

end