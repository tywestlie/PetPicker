require 'rails_helper'

describe "post a user" do
  it 'adds a user in database with name and password and gets a key' do

    post "/api/v1/users", params: {user: {name: "banana", password: "1234"}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")

    body = JSON.parse(response.body)
    expect(body["key"]).to be_a(String)
    expect(body["key"].length).to eq(22)
  end

  it 'adds user with all parameter' do
    post "/api/v1/users", params: {user: {name: "banana", password: "1234", role: "adopter", species_to_adopt: "dog", lat: 30.5, lng: 33.44, search_radius: 4, pic: "www.somepic.com", description: "I like puppies"}}

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

  it 'user cant become and admin' do
    post "/api/v1/users", params: {user: {name: "banana", password: "1234", role: "admin", species_to_adopt: "dog", lat: 30.5, lng: 33.44, search_radius: 4}}
    user = User.all.first
    expect(user.role).to eq("adopter")
  end

  it 'user can become an owner' do
    post "/api/v1/users", params: {user: {name: "banana", password: "1234", role: "owner", species_to_adopt: "dog", lat: 30.5, lng: 33.44, search_radius: 4}}
    user = User.all.first
    expect(user.role).to eq("owner")
  end
end
