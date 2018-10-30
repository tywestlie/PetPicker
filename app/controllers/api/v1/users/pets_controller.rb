class Api::V1::Users::PetsController < ApplicationController

  before_action :validate_token

  def index
    pets = Pet.find_pets(params['id'])
    render json: pets
  end

  def create
    user = User.find(params["id"])
    pet = user.pets.create(pet_params)
    render json: {message: "Created #{pet.name}"}
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :pic, :age, :weight)
  end
end
