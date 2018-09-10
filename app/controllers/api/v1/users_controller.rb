class Api::V1::UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
