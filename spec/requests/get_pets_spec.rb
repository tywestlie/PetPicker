require 'rails_helper'

describe 'get pets' do
  it 'gets all pets' do
    user = create(:user)
    user2 = create(:user)

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user.id)
    pet3 = create(:pet, user_id: user2.id)
    pet4 = create(:pet, user_id: user2.id)

    get "/api/v1/users/#{user.id}/pets"

    expect(response).to be_successful
    body = JSON.parse(response.body)
  end

  it 'gets the 10 that user has not matched with pets' do
    user = create(:user)
    user2 = create(:user)

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

    Connection.create(status: 1, adopter: user, pet: pet2)
    Connection.create(status: 2, adopter: user, pet: pet3)

    get "/api/v1/users/#{user.id}/pets"

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to be_a(Array)
    expect(body.length).to eq(10)
    body.each do |pet|
      expect(pet["name"]).to_not eq(pet1.name)
      expect(pet["name"]).to_not eq(pet2.name)
      expect(pet["name"]).to_not eq(pet3.name)
    end
  end
end
