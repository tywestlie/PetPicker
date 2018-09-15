require 'rails_helper'

describe "post a user" do

  it 'adds user with all parameter' do
    user = create(:user)

    patch "/api/v1/users/#{user.id}", params: {user: {name: "banana", password: "1234", role: "adopter", species_to_adopt: "cat", lat: 30.5, lng: 33.44, search_radius: 4}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
    # expect(user.role).to eq("adopter")
    expect(user.species_to_adopt).to eq("cat")
    expect(user.lat).to eq(30.5)
    expect(user.lng).to eq(33.44)
    expect(user.search_radius).to eq(4)
  end
end
