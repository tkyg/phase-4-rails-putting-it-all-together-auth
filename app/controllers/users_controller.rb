class UsersController < ApplicationController
  wrap_parameters format: []

  skip_before_action :authorize, only: :create

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    current_user = User.find(session[:user_id])
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end

  # def user_params
  #   params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  # end
end
