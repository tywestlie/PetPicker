require 'rails_helper'

describe "post a user" do
  it 'adds a user in database with name and password' do

    post "/api/v1/users", params: {user: {name: "banana", password: "1234"}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
  end

  it 'adds user with all parameter' do
    post "/api/v1/users", params: {user: {name: "banana", password: "1234", role: 1, species_to_adopt: 1, lat: 30.5, lng: 33.44, search_radius: 4}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
    expect(user.role).to eq("adopter")
    expect(user.species_to_adopt).to eq("dog")
    expect(user.lat).to eq(30.5)
    expect(user.lng).to eq(33.44)
    expect(user.search_radius).to eq(4)
  end

  xit 'user cant become and admin' do
  end
end
