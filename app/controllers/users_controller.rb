class UsersController < ApplicationController

  def index

  end

  def create
    @user = User.create params[:user]
    @phone = "+#{@user.phonenumber}"
    p '*' * 50
    p @user.name
    p @phone
    Twilioer.send_message @phone, @user.name
    redirect_to user_path @user
  end

  def new
    @user = User.new
  end

  def show
    @user = User.last
  end

end