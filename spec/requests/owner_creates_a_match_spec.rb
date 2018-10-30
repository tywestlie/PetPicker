require 'rails_helper'

describe '/api/v1/users/:id/matches/:id' do
  it 'cant create a match without a valid token' do
    owner = create(:user)
    adopter = create(:user)
    pet1 = create(:pet, user_id: owner.id)
    pet2 = create(:pet, user_id: owner.id)
    pet3 = create(:pet, user_id: owner.id)

    conn1 = Connection.create(status:'like', adopter: adopter, pet: pet2)

    post "/api/v1/users/#{owner.id}/matches/#{conn1.id}"

    expect(response).to_not be_successful
  end

  it 'can create a match if an adopter likes the pet' do
    owner = create(:user)
    token = JWT.encode owner.id, Rails.application.secret_key_base, 'HS256'
    adopter = create(:user)
    pet1 = create(:pet, user_id: owner.id)
    pet2 = create(:pet, user_id: owner.id)
    pet3 = create(:pet, user_id: owner.id)

    conn1 = Connection.create(status:'like', adopter: adopter, pet: pet2)

    post "/api/v1/users/#{owner.id}/matches/#{conn1.id}", params: {token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(Connection.last.status).to eq('match')
  end
end
