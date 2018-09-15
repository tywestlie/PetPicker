require 'rails_helper'

describe "gets a welcome pet" do
  it 'returns a welcome pet' do
    user = create(:user)
    pet = create(:pet, user: user)

    get "/api/v1/pets"

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body["name"]).to eq(pet.name)
    expect(body["pic"]).to eq(pet.pic)
  end
end
