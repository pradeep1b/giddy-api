class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def show
    render json: current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {}, status: 200
    else
      render json: user.errors, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end