class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    role = params["user"]["role"]
    authenticate_role(user, role)
    user.save_with_key
    render json: {"key": user.key, "id": user.id, "name": user.name}
  end

  def index
    user = User.find_by_name(params[:name])
    pass = params[:password]
    authenticate_user(user, pass)
  end

  def update
    user = User.find(params[:id])
    role = params["user"]["role"]
    user.update(user_params)
    authenticate_role(user, role)
    user.save
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "#{user.name} has been removed"}
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :species_to_adopt, :lat, :lng, :search_radius, :pic, :description)
  end
end
