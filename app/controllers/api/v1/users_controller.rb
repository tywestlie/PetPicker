class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if params["user"]["role"] == "owner"
      user.role = "owner"
    else
      user.role = "adopter"
    end
    user.save_with_key
    render json: {"key": user.key, "id": user.id, "name": user.name}
  end

  def index
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: { "message": "login failed" }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :species_to_adopt, :lat, :lng, :search_radius)
  end
end
