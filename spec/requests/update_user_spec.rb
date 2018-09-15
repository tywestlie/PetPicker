require 'rails_helper'

describe "update a user" do
  it 'updates user with all parameters' do
    user = create(:user)

    patch "/api/v1/users/#{user.id}", params: {user: {name: "banana", password: "1234", role: "adopter", species_to_adopt: "cat", lat: 30.5, lng: 33.44, search_radius: 4}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
    expect(user.role).to eq("adopter")
    expect(user.species_to_adopt).to eq("cat")
    expect(user.lat).to eq(30.5)
    expect(user.lng).to eq(33.44)
    expect(user.search_radius).to eq(4)
  end

  it 'can make the user an owner' do
    user = create(:user)
    # Can fail on 2 word Simpson name
    patch "/api/v1/users/#{user.id}", params: {user: {name: "banana", password: "1234", role: "owner", species_to_adopt: "dog", lat: 30.5, lng: 33.44, search_radius: 4}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
    expect(user.role).to eq("owner")
    expect(user.species_to_adopt).to eq("dog")
    expect(user.lat).to eq(30.5)
    expect(user.lng).to eq(33.44)
    expect(user.search_radius).to eq(4)
  end
end
