require 'rails_helper'

describe "Adopter likes a pet" do
  it 'creates a like connection' do
    user = create(:user)
    user2 = create(:user)
    pet = create(:pet, user: user2)

    post "/api/v1/users/#{user.id}/connections", params: {pet_id: pet.id}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    conn = Connection.first
    expect(conn.pet_id).to eq(pet.id)
    expect(conn.adopter_id).to eq(user.id)
    expect(conn.status).to eq("like")
    expect(body["message"]).to eq("You liked #{pet.name}")
  end
end
