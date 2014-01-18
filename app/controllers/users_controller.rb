class UsersController < ApplicationController

  # def login user
  #   session[:user_id] = user.id
  # end

  # def current_user
  #   @current_user ||= User.find session[:user_id] if session[:user_id]
  # end
# need to figure out why rails is not seeing these methods in application helpers...

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

  helper_method :current_user
  helper_method :login

end