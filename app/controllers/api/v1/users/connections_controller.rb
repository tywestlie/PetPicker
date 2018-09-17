class Api::V1::Users::ConnectionsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    puts "About to create like connection for pet #{pet.name} and user #{User.find(params[:id]).name}"
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "like")
    if connection.persisted?
      puts "Created connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
      render json: {message: "You liked #{pet.name}"}
    else
      puts "DID NOT SAVE connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
    end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    puts "About to create nope connection for pet #{pet.name} and user #{User.find(params[:id]).name}"
    connection = Connection.create(pet_id: pet.id, adopter_id: params[:id], status: "nope")
    if connection.persisted?
      puts "Created connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
      render json: {message: "You noped #{pet.name}"}
    else
      puts "DID NOT SAVE connection #{connection.id} with status #{connection.status} for pet #{connection.pet.name} and user #{connection.adopter.name}"
    end
  end
end
