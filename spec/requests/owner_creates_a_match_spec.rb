require 'rails_helper'

describe '/api/v1/users/:id/matches/:id' do
  it 'can create a match if an adopter likes the pet' do
    owner = create(:user)
    adopter = create(:user)
    pet1 = create(:pet, user_id: owner.id)
    pet2 = create(:pet, user_id: owner.id)
    pet3 = create(:pet, user_id: owner.id)

    conn1 = Connection.create(status:'like', adopter: adopter, pet: pet2)

    post "/api/v1/users/#{owner.id}/matches/#{conn1.id}"

    expect(response).to be_successful

    expect(Connection.last.status).to eq('match')
  end
end
