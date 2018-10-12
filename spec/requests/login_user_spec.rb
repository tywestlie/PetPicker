require 'rails_helper'

describe 'user login' do
  it 'gets user info with name and password' do
    user = create(:user, password: '1234')

    get "/api/v1/users?name=#{user.name}&password=#{'1234'}"

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body["name"]).to eq(user.name)
    expect(user["id"]).to eq(user.id)
  end

  it 'gets returns a 404 with failed login' do
    user = create(:user, password: '1234')

    get "/api/v1/users?name=#{user.name}&password=#{'5678'}"

    expect(status).to eq(404)
    body = JSON.parse(response.body)

    expect(body["message"]).to eq("login failed")
  end
end
