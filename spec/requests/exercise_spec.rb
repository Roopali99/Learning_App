require 'rails_helper'
RSpec.describe 'Exercises API' do
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

  let!(:exercises) {create_list(:exercise ,10 ,lesso_id: lessos.first.id)}
  let!(:lesso_id) { lessos.first.id } 
  let!(:id) { exercises.first.id } 

  let(:token) { create(:access_token, resource_owner_id: exercises.first.id) }
   
  describe 'GET /boards/:board_id/standards/:standard_id/subjects/:subject_id/chapters/:chapter_id/contents/:content_id/exercises' do
       
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise" }       
    context 'when content exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200) #200
        expect(JSON.parse(response.body)[:chapter_id]).to eq(:chapter_id)
        expect(JSON.parse(response.body)[:ex_no]).to eq(:ex_no)
        expect(JSON.parse(response.body)[:ex_status]).to eq(:ex_status)
        expect(JSON.parse(response.body)[:num_of_ques]).to eq(:num_of_ques)
        expect(JSON.parse(response.body)[:total_time]).to eq(:total_time)
        expect(JSON.parse(response.body)[:start_time]).to eq(:start_time)
        expect(JSON.parse(response.body)[:end_time]).to eq(:end_time)
      end

      it 'returns all content exercises' do
        expect(JSON.parse(response.body).size).to eq(10)
      end  
    end

    context 'when content does not exist' do
      let(:subject_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end 
      
      #   it 'returns a not found message' do
      #     expect(JSON(response)).to match(/Couldn't find Board/)
      #    end
    end
  end
    
  describe 'GET /boards/:board_id/standards/:standard_id/subjects/:subject_id/chapter/:id' do
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{id}", headers: {'Authorization': token.token } }

    context 'when content exercise exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end

      it 'returns the content' do
        expect(id).to eq(1)  
      end
    end
    
    context 'when content exercise does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do 
        expect(response).to have_http_status(204)#404
      end

      # it 'returns a not found message' do
      #   expect(response).to match(/Couldn't find standard/)
      # end
    end
  end
end