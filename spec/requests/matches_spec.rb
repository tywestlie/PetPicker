require 'rails_helper'

describe '/api/v1/users/:id/matches' do
  it 'wont show adopter data for an owner without valid token' do
    user = create(:user, role: 'adopter')
    user2 = create(:user, role: 'owner')
    user3 = create(:user, role: 'adopter')
    user4 = create(:user, role: 'adopter')
    user5 = create(:user, role: 'adopter')

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user2.id)
    pet4 = create(:pet, user_id: user2.id)
    pet5 = create(:pet, user_id: user2.id)
    pet6 = create(:pet, user_id: user2.id)
    pet7 = create(:pet, user_id: user2.id)
    pet8 = create(:pet, user_id: user2.id)
    pet9 = create(:pet, user_id: user2.id)
    pet10 = create(:pet, user_id: user2.id)
    pet11 = create(:pet, user_id: user2.id)
    pet12 = create(:pet, user_id: user2.id)
    pet13 = create(:pet, user_id: user2.id)
    pet14 = create(:pet, user_id: user2.id)
    pet15 = create(:pet, user_id: user2.id)

    Connection.create(status: 'like', adopter: user, pet: pet2)
    Connection.create(status: 'like', adopter: user, pet: pet3)
    Connection.create(status: 'like', adopter: user, pet: pet4)
    Connection.create(status: 'nope', adopter: user4, pet: pet5)
    Connection.create(status: 'nope', adopter: user3, pet: pet6)
    Connection.create(status: 'match', adopter: user3, pet: pet7)
    Connection.create(status: 'match', adopter: user4, pet: pet8)
    Connection.create(status: 'nope', adopter: user5, pet: pet12)

    get "/api/v1/users/#{user2.id}/matches"

    expect(response).to_not be_successful
  end

  it 'renders adopter data for an owner' do
    user = create(:user, role: 'adopter')
    user2 = create(:user, role: 'owner')
    token = JWT.encode user2.id, Rails.application.secret_key_base, 'HS256'
    user3 = create(:user, role: 'adopter')
    user4 = create(:user, role: 'adopter')
    user5 = create(:user, role: 'adopter')

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user2.id)
    pet4 = create(:pet, user_id: user2.id)
    pet5 = create(:pet, user_id: user2.id)
    pet6 = create(:pet, user_id: user2.id)
    pet7 = create(:pet, user_id: user2.id)
    pet8 = create(:pet, user_id: user2.id)
    pet9 = create(:pet, user_id: user2.id)
    pet10 = create(:pet, user_id: user2.id)
    pet11 = create(:pet, user_id: user2.id)
    pet12 = create(:pet, user_id: user2.id)
    pet13 = create(:pet, user_id: user2.id)
    pet14 = create(:pet, user_id: user2.id)
    pet15 = create(:pet, user_id: user2.id)

    Connection.create(status: 'like', adopter: user, pet: pet2)
    Connection.create(status: 'like', adopter: user, pet: pet3)
    Connection.create(status: 'like', adopter: user, pet: pet4)
    Connection.create(status: 'nope', adopter: user4, pet: pet5)
    Connection.create(status: 'nope', adopter: user3, pet: pet6)
    Connection.create(status: 'match', adopter: user3, pet: pet7)
    Connection.create(status: 'match', adopter: user4, pet: pet8)
    Connection.create(status: 'nope', adopter: user5, pet: pet12)

    get "/api/v1/users/#{user2.id}/matches", params: {token: token}
    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body).to be_a(Array)
    expect(body.length).to eq(5)
    # body.each do |user|
    #   expect(user["name"]).to_not eq(user2.name)
    #   expect(user["name"]).to_not eq(user5.name)
    # end
  end

  it 'renders pet data for an adopter' do
    user = create(:user, role: 'adopter')
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    user2 = create(:user, role: 'owner')
    user3 = create(:user, role: 'adopter')
    user4 = create(:user, role: 'adopter')
    user5 = create(:user, role: 'adopter')

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user2.id)
    pet4 = create(:pet, user_id: user2.id)
    pet5 = create(:pet, user_id: user2.id)
    pet6 = create(:pet, user_id: user2.id)
    pet7 = create(:pet, user_id: user2.id)
    pet8 = create(:pet, user_id: user2.id)
    pet9 = create(:pet, user_id: user2.id)
    pet10 = create(:pet, user_id: user2.id)
    pet11 = create(:pet, user_id: user2.id)
    pet12 = create(:pet, user_id: user2.id)
    pet13 = create(:pet, user_id: user2.id)
    pet14 = create(:pet, user_id: user2.id)
    pet15 = create(:pet, user_id: user2.id)

    Connection.create(status: 'match', adopter: user, pet: pet2)
    Connection.create(status: 'match', adopter: user, pet: pet3)
    Connection.create(status: 'match', adopter: user, pet: pet4)
    Connection.create(status: 'nope', adopter: user4, pet: pet5)
    Connection.create(status: 'nope', adopter: user, pet: pet6)
    Connection.create(status: 'like', adopter: user3, pet: pet7)
    Connection.create(status: 'like', adopter: user, pet: pet8)

    get "/api/v1/users/#{user.id}/matches", params: {token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to be_a(Array)
    expect(body.length).to eq(3)

    body.each do |pet|
      expect(pet["name"]).to_not eq(pet5.name)
      expect(pet["name"]).to_not eq(pet6.name)
      expect(pet["name"]).to_not eq(pet7.name)
      expect(pet["name"]).to_not eq(pet8.name)
    end
  end

end
