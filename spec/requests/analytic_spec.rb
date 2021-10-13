require 'rails_helper'
RSpec.describe 'Analysis  API' do
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
  
  let!(:analysis) {create_list(:analytic ,10 ,exercise_id: exercises.first.id)}
  let!(:exercise_id) { exercises.first.id } 
  let!(:id) { analysis.first.id }

  let(:token) { FactoryBot.create(:access_token, resource_owner_id: analysis.first.id) }
  
    describe 'GET analytics' do
      
      before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{exercise_id}/analytic" }         
        context 'when student solution exists' do
          it 'returns status code 200' do
              puts response.inspect
              expect(response).to have_http_status(200) #200
          end
          it 'returns all student solution analysis' do
              expect(JSON.parse(response.body).size).to eq(10)
          end
        end

        context 'when student_solution does not exist' do
            let(:subject_id) { 0 }

            it 'returns status code 404' do
              expect(response).to have_http_status(404)
            end 
          #   it 'returns a not found message' do
          #     expect(JSON(response)).to match(/Couldn't find Board/)
          #    end
      end
    end
  
    describe 'GET analytics' do
        before { get "/account/#{account_id}/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/lesso/#{lesso_id}/exercise/#{exercise_id}/analytic/#{id}",headers: {'Authorization': token.token } }

        context 'when content exercise exists' do
            it 'returns status code 200' do
              expect(response).to have_http_status(200)
            end
            it 'returns the content' do
              expect(id).to eq(1)  
              expect(JSON.parse(response.body)[:ex_no]).to eq(:ex_no)
              expect(JSON.parse(response.body)[:total_ans_ampt]).to eq(:total_ans_ampt)
              expect(JSON.parse(response.body)[:correct_ans]).to eq(:correct_ans)
              expect(JSON.parse(response.body)[:wrong_ans]).to eq(:wrong_ans)
              expect(JSON.parse(response.body)[:score]).to eq(:score)
              expect(JSON.parse(response.body)[:accuracy]).to eq(:accuracy)
              expect(JSON.parse(response.body)[:speed]).to eq(:speed)
              expect(JSON.parse(response.body)[:time]).to eq(:time)
            end
        end
  
        context 'when content exercise does not exist' do
            let(:id) { 0 }
            it 'returns status code 404' do 
                expect(response).to have_http_status(404)
            end

            # it 'returns a not found message' do
            #     expect(response).to match(/Couldn't find standard/)
            # end
        end
    end
    # describe 'PUT /boards/:board_id/standards/:stid' do
    #     let(:valid_attributes) { { score:50}}

    #     before { put "/boards/#{board_id}/standards/#{standard_id}/subjects/#{subject_id}/chapter/#{chapter_id}/content/#{content_id}/exercise/#{exercise_id}/question/#{question_id}/student_solution/#{student_solution_id}/analytics/#{id}", params: valid_attributes }

    #     context 'when item exists' do
    #         it 'returns status code 204' do
    #             expect(response).to have_http_status(204)
    #         end
    #         it 'updates the item' do
    #             updated_item = student_solutions.find(id)
    #             expect(updated_item.ques_status).to match('50')
    #         end
    #     end
    #     context 'when the item does not exist' do
    #         let(:id) { 0 }
    #         it 'returns status code 404' do
    #             expect(response).to have_http_status(404)
    #         end

    #         # it 'returns a not found message' do
    #         #     expect(response).to match(/Couldn't find Item/)
    #         # end
    #     end
    # end
end

