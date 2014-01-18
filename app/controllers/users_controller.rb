class UsersController < ApplicationController

  def index

  end

  def create
    @user = User.create params[:user]
    p @user
    if @user.present?
      login @user
      state = params[:user][:state]
      city = params[:user][:city]
      @election_ids = get_elections state, city
      send_message @election_ids[0]
      redirect_to user_path @user
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    state = current_user.state
    city = current_user.city
    @election_ids = get_elections state, city
  end

  helper_method :current_user
  helper_method :login

end