require 'rails_helper'

describe 'DELETE /api/v1/users/:id/' do
  it 'doesnt delete without token' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    pet1 = create(:pet, user_id: user1.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user3.id)

    delete "/api/v1/users/#{user1.id}"

    expect(response).to_not be_successful
  end

  it 'deletes a user' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    token = JWT.encode user1.id, Rails.application.secret_key_base, 'HS256'

    pet1 = create(:pet, user_id: user1.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user3.id)

    delete "/api/v1/users/#{user1.id}", params: {token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("#{user1.name} has been removed")
  end

  it '404 if user doesnt exist' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    token = JWT.encode 4, Rails.application.secret_key_base, 'HS256'

    pet1 = create(:pet, user_id: user1.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user3.id)

    delete "/api/v1/users/4", params: {token: token}

    expect(response.status).to eq(404)

    body = JSON.parse(response.body)
    expect(body["message"]).to eq("Not Found")
  end
end
