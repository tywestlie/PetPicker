require 'rails_helper'

describe 'DELETE /api/v1/users/:id/' do
  it 'deletes a user' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    pet1 = create(:pet, user_id: user1.id)
    pet2 = create(:pet, user_id: user2.id)
    pet3 = create(:pet, user_id: user3.id)

    delete "/api/v1/users/#{user1.id}"

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("#{user1.name} has been removed")
  end
end
