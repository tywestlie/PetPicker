require 'rails_helper'

describe 'post a pet' do
  it 'adds a pet to the database' do
    user = create(:user)
    post "/api/v1/users/#{user.id}/pets", params: {pet: {name: "puppy-boi", pic:"https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg"}}

    expect(response).to be_successful
    pet = user.pets.last
    expect(pet.name).to eq("puppy-boi")
    expect(pet.pic).to eq("https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg")
  end
end
