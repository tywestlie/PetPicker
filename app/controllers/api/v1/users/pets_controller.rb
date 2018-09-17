class Api::V1::Users::PetsController < ApplicationController

  def index
    user = User.find(params["id"])
    pets = Pet.find_by_sql(
      "SELECT pets.*
       FROM pets
       LEFT OUTER JOIN connections ON connections.pet_id = pets.id
       WHERE (connections.id is null OR connections.adopter_id != #{user.id}) AND (pets.user_id != #{user.id})
       GROUP BY pets.id
       LIMIT 10"
     )
    render json: pets
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
