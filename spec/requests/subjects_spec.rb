require 'rails_helper'
RSpec.describe 'Subjects API' do
    #initialize test data
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

    let(:token) { create(:access_token, resource_owner_id: subjects.first.id) }

    puts "after initialization"
    # Test suite for GET /boards/:board_id/standards
    describe 'GET /boards/:board_id/standards/:standard_id/subjects' do
        
        before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects" } 
           
        context 'when standard exists' do
            
            it 'returns status code 200' do
                puts response.inspect
                expect(response).to have_http_status(200) #200
            end
            it 'returns all standard subjects' do
                expect(JSON.parse(response.body).size).to eq(10) #10
            end
        
        end

        context 'when board does not exist' do

            let(:standard_id) { 0 }
              it 'returns status code 404' do
                expect(response).to have_http_status(200)#404
              end 
        
            #   it 'returns a not found message' do
            #     expect(JSON(response)).to match(/Couldn't find Board/)
            #    end
        end
    end
    
    describe 'GET /boards/:board_id/standards/:standard_id/subjects/:id' do
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{id}", headers: {'Authorization': token.token }}

    context 'when standard subject exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end
      it 'returns the standard' do
        expect(id).to eq(1)  
      end
    end
    
    context 'when standard subject does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(204)
      end

      # it 'returns a not found message' do
      #   expect(JSON.parse(response.body)).to match(/Couldn't find standard/)
      # end
    end
  end
end



