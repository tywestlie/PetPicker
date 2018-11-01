class Api::V1::Users::ConnectionsController < ApplicationController
  before_action :validate_token

  def create
    pet = Pet.find(params[:pet_id])
    Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    render json: {message: "You liked #{pet.name}"}
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "nope")
    render json: {message: "You noped #{pet.name}"}
  end
end
