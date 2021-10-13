require 'rails_helper'
RSpec.describe 'Chapters API' do 

  let!(:account) { create(:account) }
  let!(:boards) {create_list(:board ,10 ,account_id: account.id) }
  let!(:account_id) {account.id}
  let!(:id) {boards.first.id}

  let!(:standard) {create_list(:standard ,10 ,board_id: boards.first.id)}
  let!(:board_id) { boards.first.id } 
  let!(:id) { standard.first.id }

  let!(:subjects) {create_list(:subject ,10 ,standard_id: standard.first.id)}
  let!(:standard_id) { standard.first.id } 
  let!(:id) { subjects.first.id } 
  
  let!(:lessos) {create_list(:lesso ,10 ,subject_id: subjects.first.id)}
  let!(:subject_id) { subjects.first.id } 
  let!(:id) { lessos.first.id }

  let!(:videos) {create_list(:video ,10 ,lesso_id: lessos.first.id)}
  let!(:lesso_id) { lessos.first.id } 
  let!(:id) { videos.first.id }
  
  let(:token) { create(:access_token, resource_owner_id: lessos.first.id) }
  describe 'GET /boards/:board_id/standards/:standard_id/subjects/:subject_id/chapter' do
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso" }     
    context 'when standard exists' do    
      it 'returns status code 200' do
        expect(response).to have_http_status(200)

      end

      it 'returns all subject chapters' do
        expect(JSON.parse(response.body).size).to eq(1) 
        expect(JSON.parse(response.body)[:chapter_nm]).to eq(:chapter_nm)
      end
      
    end

    context 'when board does not exist' do
      let(:standard_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end 
      
      # it 'returns a not found message' do
      #   expect(JSON(response)).to match(/Couldn't find Board/)
      #  end
    end
  end

  describe 'GET /boards/:board_id/standards/:standard_id/subjects/:subject_id/chapter/:id' do
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{id}", headers: {'Authorization': token.token } }

    context 'when standard subject exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 
      it 'returns the standard' do
        expect(id).to eq(1)  
      end
    end
    
    context 'when standard subject does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end

      # it 'returns a not found message' do
      #   expect(response).to match(/Couldn't find standard/)
      # end
    end
  end
end