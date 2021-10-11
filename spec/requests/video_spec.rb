require 'rails_helper'

RSpec.describe 'Video API' do
  #initialize test data
  let!(:board) { create(:board) } 
  
  let!(:standard) {create_list(:standard ,10 ,board_id: board.id)}
  let!(:board_id) { board.id } 
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

  
  describe 'GET /boards/#{board_id}/standards/#{standard_id}/subjects/:subject_id/lesso/#{lesso_id}/video' do
      
  before { get "/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/video" }
  # puts "is it coming back here"       
      context 'when video exists' do
          
          it 'returns status code 200' do
            expect(response).to have_http_status(200) #200
          end
          it 'returns all lesso videos' do
            expect(JSON.parse(response.body).size).to eq(1) #10
            puts "KAI YETAY BAGHU"
            puts response.body
          end
      
      end

      context 'when lesso does not exist' do

          let(:video_id) { 0 }
            it 'returns status code 404' do
              expect(response).to have_http_status(404)
            end 
      
          #   it 'returns a not found message' do
          #     expect(JSON(response)).to match(/Couldn't find Board/)
          #    end
      end
  end
  # Test suite for GET /boards/:board_id/standards/:id
  describe 'GET /boards/:board_id/standards/:standard_id/subjects/subject_id/lesso/lesso_id/video/id' do
  before { get "/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/video/#{id}" }

  context 'when standard subject exists' do
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
      # puts "ID WISE YETAY KAA??"
      # puts response.body
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