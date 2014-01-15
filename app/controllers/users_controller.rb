class UsersController < ApplicationController

  def index

  end

  def create
    @user = User.create params[:user]
  end

  def new
    @user = User.new
  end

  def show

  end

end