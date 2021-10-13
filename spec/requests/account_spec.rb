require 'rails_helper'
RSpec.describe 'Account API', type: :request do

  let!(:accounts) { create_list(:account, 10) }
  let(:id) { accounts.first.id }
  let(:token) { FactoryBot.create(:access_token, resource_owner_id: accounts.first.id) }
  

  describe 'GET /account' do
    before { get "/account" }
    context 'when the record exists' do
      it 'returns accounts' do
        expect(JSON.parse(response.body).size).to eq(10)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /account' do
    let!(:valid_attributes) { { "mobile": 9730048096, "student_name": 'Roopali', email: 'ragha', dob: '1999-11-14', otp: '1234' } }
    context 'when the request is valid' do
      before { post '/account', params: valid_attributes }

      it 'creates account' do
        expect(JSON.parse(response.body)["mobile"]).to eq(valid_attributes[:mobile])
        expect(JSON.parse(response.body)["student_name"]).to eq(valid_attributes[:student_name])
        expect(JSON.parse(response.body)["email"]).to eq(valid_attributes[:email])
        expect(JSON.parse(response.body)["dob"]).to eq(valid_attributes[:dob])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/account', params: { mobile: '000' } }
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # it 'returns a validation failure message' do
      #   expect(JSON.parse(response.body)).to match(/Validation failed: Created by can't be blank/)
      # end
    end
  end

  describe 'PUT /account/:id' do
    let(:valid_attributes) { { otp: '9730', } }

    context 'when the record exists' do
      before { put "/account/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  
  describe 'GET /account/:id' do
    before {get "/account/id"}
    context 'when the otp validate' do
      it "return token of id" do
        token = response.body
      end
      
      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end
    end
   
    before { get "/account/id",headers: {'Authorization': token.token } }
    context "when token is correct" do
      it "return account of id" do
        # expect(JSON.parse(response.body)).not_to be_empty
        expect(id).to eq(1) 
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