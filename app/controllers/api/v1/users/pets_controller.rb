class Api::V1::Users::PetsController < ApplicationController

  def index
    # binding.pry
    if authenticate_token(params['id'], params['token'])
      pets = Pet.find_pets(params["id"])
      render json: pets
    else
      render json: {message: 'invalid token'}, status: 400
    end
  end

  def create
    user = User.find(params["id"])
    pet = user.pets.create(pet_params)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :pic, :age, :weight)
  end
end
