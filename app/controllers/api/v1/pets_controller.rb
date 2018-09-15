class Api::V1::PetsController < ApplicationController
  def index
    pet = Pet.first
    render json: pet
  end
end
