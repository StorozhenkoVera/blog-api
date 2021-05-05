class UsersController < ApplicationController
  def index
    @users = User.all

    #render json: @users, status: :ok
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    #render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created'
      redirect_to root_path
    else
      flash.now[:error] = 'Unable to create user'
    end
  end

  private
  def user_params
    params.permit(:name)
  end
end