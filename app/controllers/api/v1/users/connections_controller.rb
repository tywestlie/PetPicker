class Api::V1::Users::ConnectionsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    render json: {message: "You liked #{pet.name}"}
  end
end
