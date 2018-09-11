require 'rails_helper'

describe 'get pets' do
  it 'gets all pets connected to a user' do
    user = create(:user)

    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user.id)
    pet3 = create(:pet, user_id: user.id)

    get '/api/v1/pets'

    expect(response).to be_successful
  end
end
