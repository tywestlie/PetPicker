class Api::V1::Users::ConnectionsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    puts "About to create like connection for pet #{pet.name} and user #{User.find(params[:id]).name}"
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    puts "Created connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
    render json: {message: "You liked #{pet.name}"}
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    puts "About to create nope connection for pet #{pet.name} and user #{User.find(params[:id]).name}"
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "nope")
    puts "Created connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
    render json: {message: "You noped #{pet.name}"}
  end
end
