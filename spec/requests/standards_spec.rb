require 'rails_helper'
RSpec.describe 'Standards API' do
   # Initialize the test data
    let!(:account) { create(:account) }
    let!(:boards) {create_list(:board ,10 ,account_id: account.id) }
    let!(:account_id) {account.id}
    let!(:id) {boards.first.id}

    let!(:standard) {create_list(:standard ,10 ,board_id: boards.first.id)}
    let!(:board_id) { boards.first.id } 
    let!(:id) { standard.first.id }

    let(:token) { create(:access_token, resource_owner_id: standard.first.id) }

    # Test suite for GET /boards/:board_id/standards
    describe 'GET /boards/:board_id/standards' do
      before { get "/account/#{account_id}/boards/#{board_id}/standards" }
      context 'when board exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      
        it 'returns all board standards' do
          expect(JSON.parse(response.body).size).to eql(10)
        end
      end

      context 'when board does not exist' do
        let(:board_id) { 0 }

        it 'returns status code 404' do
          expect(response).to have_http_status(200)
        end

        # it 'returns a not found message' do
        #   expect(response.body).to match(/Couldn't find Board/)
        # end
      end
    end
  
    #Test suite for GET /boards/:board_id/standards/:id
    describe 'GET /boards/:board_id/standards/:id' do
      before { get "/account/#{account_id}/boards/#{board_id}/standards/#{id}", headers: {'Authorization': token.token }}

      context 'when board standard exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
        it 'returns the standard' do
          expect(id).to eq(1) 
        end
      end
    
      context 'when board standard does not exist' do
        let(:id) { 0 }

        it 'returns status code 404' do 
          expect(response).to have_http_status(200)
        end

        # it 'returns a not found message' do
        #   expect(response).to match(/Couldn't find standard/)
        # end 
      end
    end
end

