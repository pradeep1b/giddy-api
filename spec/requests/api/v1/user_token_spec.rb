require 'rails_helper'

RSpec.describe 'Giddy user token API V1', type: :request do
  describe 'POST /api/v1/activities' do
    context 'when user exists' do
      let(:valid_attributes) { {'auth': {'email': 'foo@bar.com', 'password': 'secret'}} }
     
      before do
        create(:user, email: 'foo@bar.com')
        post '/api/v1/user_token',
             params: valid_attributes
      end

      it 'returns jwt token in body' do
        expect(json['jwt']).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when user does not exists' do
      let(:valid_attributes) { {'auth': {'email': 'foo@bar.com', 'password': 'secret'}} }
     
      before do
        post '/api/v1/user_token',
             params: valid_attributes
      end

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end