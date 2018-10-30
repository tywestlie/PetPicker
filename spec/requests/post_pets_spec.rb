require 'rails_helper'

describe 'post a pet' do
  it 'adds a pet to the database' do
    user = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    post "/api/v1/users/#{user.id}/pets", params: {pet: {name: "puppy-boi", pic:"https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg"}, token: token}

    expect(response).to be_successful
    pet = user.pets.last
    expect(pet.name).to eq("puppy-boi")
    expect(pet.pic).to eq("https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg")
    body = JSON.parse(response.body)
    expect(body['message']).to eq('Created puppy-boi')
  end

  it 'fails to add a pet with invalid token' do
    user = create(:user)
    post "/api/v1/users/#{user.id}/pets", params: {pet: {name: "puppy-boi", pic:"https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg"}}

    expect(response).to_not be_successful
  end
end
