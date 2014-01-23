class UsersController < ApplicationController

  def index
    redirect_to new_user_path
  end

  def create
    @user = User.create params[:user]
    if @user.present?
      login @user
      state = params[:user][:state]
      city = params[:user][:city]
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
    @election_ids = get_elections @state, city
    @show = get_candidates @state, city
    # show_all_info ################### FOR TESTING
    # send_message @show # @show for now... will be real info when becomes avail
  end

  helper_method :current_user
  helper_method :login

end