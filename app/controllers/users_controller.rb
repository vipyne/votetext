class UsersController < ApplicationController

  def index
    redirect_to new_user_path
  end

  def create
    @user = User.create params[:user]
    if @user.present?
      if params[:commit] == "get representatives"
        @user.update_attributes :submit => "get representatives"
      end
      login @user
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
    @state = current_user.state
    city = current_user.city
    ids = get_elections @state, city
    if current_user.submit == "get representatives"
      @reps = get_reps current_user.full_address
    else
      @show = get_candidates @state, city
    end
  end

  helper_method :current_user
  helper_method :login

end