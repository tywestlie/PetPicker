class Api::V1::Users::PetsController < ApplicationController

  def create
    user = User.find(params["id"])
    pet = user.pets.create(pet_params)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :pic, :age, :weight)
  end
end
