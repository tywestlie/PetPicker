require 'rails_helper'

describe 'user login' do
  it 'gets user info with name and password' do
    user = create(:user, password: '1234')

    get "/api/v1/users?name=#{user.name}&password=1234"

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body['name']).to eq(user.name)
    expect(body['id']).to eq(user.id)
    expect(body['token']).to be_a(String)
    expect(body['token'].length)
  end

  it 'fails to login with incorrect name and password' do
    user = create(:user, password: '1234')

    get "/api/v1/users?name=#{user.name}&password=1235"

    expect(response).to_not be_successful
    body = JSON.parse(response.body)
    expect(body['message']).to eq('login failed')
  end
end
