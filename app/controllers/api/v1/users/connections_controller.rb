class Api::V1::Users::ConnectionsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    name = pet.name
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    if connection.persisted?
      connection.success
      render json: {message: "You liked #{pet.name}"}
    else
      connection.failure
    end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "nope")
    if connection.persisted?
      connection.success
      render json: {message: "You noped #{pet.name}"}
    else
      connection.failure
    end
  end
end
