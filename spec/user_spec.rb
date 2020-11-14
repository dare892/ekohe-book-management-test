require 'rails_helper'

describe "Tests User", :type => :request do
  it 'creates user and returns object with token' do
    post '/users', :params => {:user => {
      :email => 'test@example.com',
      :password => '123123',
      :balance => 10
    }}
    expect(JSON.parse(response.body)['data']['attributes']['auth_token'].class).to be(String)
  end

  it 'login user is successful and returns object with token' do
    User.create(email: 'test@example.com', password: '123123', balance: 10)
    post '/authenticate', :params => {
      :email => 'test@example.com',
      :password => '123123',
    }
    expect(JSON.parse(response.body)['auth_token'].class).to be(String)
  end
end
