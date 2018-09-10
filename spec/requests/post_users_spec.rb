require 'rails_helper'

describe "post a user" do
  it 'adds a user in database with name and password' do

    post "/api/v1/users", params: {user: {name: "banana", password: "1234"}}

    expect(response).to be_successful
    user = User.all.first
    expect(user.name).to eq("banana")
    expect(user.password).to_not eq("1234")
  end
end
