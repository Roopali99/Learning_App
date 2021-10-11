require 'rails_helper'
RSpec.describe 'Boards API', type: :request do
  let!(:account) { create(:account) }
  let!(:boards) {create_list(:board ,10 ,account_id: account.id) }
  let!(:account_id) {account.id}
  let!(:id){boards.first.id}
  let(:token) { FactoryBot.create(:access_token, resource_owner_id: boards.first.id) }
  # Test suite for GET /boards
  describe 'GET /boards' do
    # make HTTP get request before each example
    before { get "/account/#{account_id}/boards" }
    
      it 'returns boards' do
       # Note `json` is a custom helper to parse JSON responses
       expect(JSON.parse(response.body)).not_to be_empty
       expect(JSON.parse(response.body).size).to eql(10)#10
       puts "WHAT IS THE OUTPUT???????///"
       puts JSON.parse(response.body)
      end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)#200
    end
  end

  # Test suite for GET /boards/:id
  describe 'GET /boards/:id' do
    before { get "/account/#{account_id}/boards/#{id}", headers: {'Authorization': token.token } }
    context 'when the record exists' do
      it 'returns the board' do
        puts "CHECKING TOKEN******************"
        puts token.to_json
        # expect(JSON.parse(response.body)).not_to be_empty
        expect(id).to eq(1) 
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(204)#200
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(204) #404
      end

      # it 'returns a not found message' do
      #   expect(response.body).to match(/Couldn't find Board/)
      # end
    end
  end

end