require 'rails_helper'

describe "Adopter likes a pet" do
  it 'doesnt create a like without a valid token' do
    user = create(:user)
    user2 = create(:user)
    pet = create(:pet, user: user2)

    post "/api/v1/users/#{user.id}/connections", params: {pet_id: pet.id}

    expect(response).to_not be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("invalid token")
  end

  it 'creates a like connection' do
    user = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    user2 = create(:user)
    pet = create(:pet, user: user2)

    post "/api/v1/users/#{user.id}/connections", params: {pet_id: pet.id, token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    conn = Connection.first
    expect(conn.pet_id).to eq(pet.id)
    expect(conn.adopter_id).to eq(user.id)
    expect(conn.status).to eq("like")
    expect(body["message"]).to eq("You liked #{pet.name}")
  end

  it 'doesnt create a like connection with invalid pet' do
    user = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    user2 = create(:user)
    pet = create(:pet, user: user2)

    post "/api/v1/users/#{user.id}/connections", params: {pet_id: (pet.id + 1), token: token}

    expect(response).to_not be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("Not Found")
  end
end

describe "Adopter nopes a pet" do
  it 'wont create a nope without a valid token' do
    user = create(:user)
    user2 = create(:user)
    pet = create(:pet, user: user2)

    delete "/api/v1/users/#{user.id}/connections", params: {pet_id: pet.id}

    expect(response).to_not be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("invalid token")
  end

  it 'creates a nope connection' do
    user = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    user2 = create(:user)
    pet = create(:pet, user: user2)

    delete "/api/v1/users/#{user.id}/connections", params: {pet_id: pet.id, token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    conn = Connection.first
    expect(conn.pet_id).to eq(pet.id)
    expect(conn.adopter_id).to eq(user.id)
    expect(conn.status).to eq("nope")
    expect(body["message"]).to eq("You noped #{pet.name}")
  end

  it 'doesnt create a nope connection with invalid pet' do
    user = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    user2 = create(:user)
    pet = create(:pet, user: user2)

    delete "/api/v1/users/#{user.id}/connections", params: {pet_id: (pet.id + 1), token: token}

    expect(response).to_not be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("Not Found")
  end
end
