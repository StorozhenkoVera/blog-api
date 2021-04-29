class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render error: {error: 'Unable to create user'}, status: 400
    end
  end

  private
  def user_params
    params.permit(:name)
  end
end