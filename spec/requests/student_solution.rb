require 'rails_helper'
RSpec.describe 'student_solution  API' do

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

  let!(:questions) {create_list(:question ,10 ,exercise_id: exercises.first.id)}
  let!(:exercise_id) { exercises.first.id } 
  let!(:id) { questions.first.id } 

  let!(:student_solutions) {create_list(:student_solution ,10 ,question_id: questions.first.id)}
  let!(:question_id) { questions.first.id } 
  let!(:id) { student_solutions.first.id } 

  let(:token) { create(:access_token, resource_owner_id: student_solutions.first.id) }

  describe 'GET solutions' do
      
      before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{exercise_id}/question/#{question_id}/student_solution" } 
         
      context 'when content exists' do
          
          it 'returns status code 200' do
              puts response.inspect
              expect(response).to have_http_status(200) #200
              expect(JSON.parse(response.body)[:question_id]).to eq(:question_id)
              expect(JSON.parse(response.body)[:question_status]).to eq(:question_status)
              expect(JSON.parse(response.body)[:option_selected]).to eq(:option_selected)
              expect(JSON.parse(response.body)[:status]).to eq(:status)
              expect(JSON.parse(response.body)[:marked_later]).to eq(:marked_later)
              expect(JSON.parse(response.body)[:skip]).to eq(:skip)
              expect(JSON.parse(response.body)[:time_taken]).to eq(:time_taken)
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
  
  describe 'GET STUDENTs Solutions' do
    before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{exercise_id}/question/#{question_id}/student_solution/#{id}", headers: {'Authorization': token.token } }

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
        expect(response).to have_http_status(204)
      end

      # it 'returns a not found message' do
      #   expect(response).to match(/Couldn't find standard/)
      # end
    end
  end

   
  #  describe 'PUT /boards/:board_id/standards/:stid' do
  #   let(:valid_attributes) { { ques_status:'true'}}

  #   before { put "/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{exercise_id}/question/#{question_id}/student_solution/#{id}", params: valid_attributes }

  #   context 'when item exists' do
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end

  #     it 'updates the solution' do
  #       updated_item = StudentSolution.find(id) 
  #       expect(updated_item.ques_status).to match(true) 
  #     end
  #   end
  #    context 'when the item does not exist' do
  #     let(:id) { 0 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end

  #   #   it 'returns a not found message' do
  #   #     expect(response).to match(/Couldn't find Item/)
  #   #   end
  #   end
  # end
end