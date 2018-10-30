require 'rails_helper'

describe 'get pets' do
  it 'wont get pets without a valid jwt' do

    user = create(:user)
    user2 = create(:user)

    create(:pet, user_id: user.id)
    create(:pet, user_id: user.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)

    get "/api/v1/users/#{user.id}/pets"

    expect(response).to_not be_successful
  end

  it 'gets all pets' do
    user = create(:user)
    user2 = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'

    create(:pet, user_id: user.id)
    create(:pet, user_id: user.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)

    get "/api/v1/users/#{user.id}/pets", params: {token: token}

    expect(response).to be_successful
  end

  it 'gets the 10 that user has not matched with pets' do
    user = create(:user)
    user2 = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)

    Connection.create(status: 1, adopter: user, pet: pet2)
    Connection.create(status: 2, adopter: user, pet: pet3)

    get "/api/v1/users/#{user.id}/pets", params: {token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to be_a(Array)
    expect(body.length).to eq(10)
    body.each do |pet|
      expect(pet['name']).to_not eq(pet1.name)
      expect(pet['name']).to_not eq(pet2.name)
      expect(pet['name']).to_not eq(pet3.name)
    end
  end

  it 'does not get pets that other users have connected to' do
    user = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)
    create(:pet, user_id: user2.id)

    Connection.create(status: 1, adopter: user3, pet: pet2)
    Connection.create(status: 2, adopter: user3, pet: pet3)
    Connection.create(status: 1, adopter: user, pet: pet2)
    Connection.create(status: 2, adopter: user, pet: pet3)

    get "/api/v1/users/#{user.id}/pets", params: {token: token}

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body).to be_a(Array)
    expect(body.length).to eq(3)
    body.each do |pet|
      expect(pet['name']).to_not eq(pet1.name)
      expect(pet['name']).to_not eq(pet2.name)
      expect(pet['name']).to_not eq(pet3.name)
    end
  end
end
