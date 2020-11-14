require 'rails_helper'

describe "Tests Book", :type => :request do
  before(:each) do
    User.create(email: 'test@example.com', password: '123123', balance: 10)
    post '/authenticate', :params => {
      :email => 'test@example.com',
      :password => '123123',
    }
    token = JSON.parse(response.body)['auth_token']
    @headers = {'Authorization' => token}
    5.times do
      Book.create(title: Faker::Book.title, price: rand(5...10), total_count: rand(1...5))
    end
  end

  it 'books index is successful' do
    get '/books', headers: @headers
    expect(response).to be_successful
  end

  it 'show book' do
    get "/books/#{Book.first.id}", params: {start_date: 30.days.ago, end_date: DateTime.now}, headers: @headers
    expect(response).to be_successful
  end

  it 'rents book' do
    post "/books/#{Book.first.id}/rent", :params => {:user_id => User.first.id}, headers: @headers
    expect(response).to be_successful
  end
end
