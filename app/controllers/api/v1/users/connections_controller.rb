class Api::V1::Users::ConnectionsController < ApplicationController
  before_action :validate_token

  def create
    pet = Pet.find(params[:pet_id])
    name = pet.name
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    if connection.persisted?
      render json: {message: "You liked #{pet.name}"}
    else
      render json: {message: "Failed to like pet"}
    end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "nope")
    if connection.persisted?
      render json: {message: "You noped #{pet.name}"}
    else
      render json: {message: "Failed to nope pet"}
    end
  end
end
