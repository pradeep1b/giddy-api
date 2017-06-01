require 'rails_helper'

RSpec.describe 'Giddy activities API V1', type: :request do
  let!(:user) { create(:user) }
  let!(:activities) { create_list(:activity, 10, user: user) }
  let(:activity_id) { activities.last.id }
  let(:activity) { activities.last }
  
  let(:track_file) do
    file_path = Rails.root.join('spec/fixtures/files/test_track.gpx').to_s
    fixture_file_upload(file_path, 'text/xml')
  end
  
  let(:track_image_file) do
    file_path = Rails.root.join('spec/fixtures/files/test_track_image.png').to_s
    fixture_file_upload(file_path, 'application/png')
  end
  
  let(:authenticated_header) do
    token = Knock::AuthToken.new(payload: {
        sub: user.id,
        email: user.email,
        name: user.username,
        email_verified: true,
        picture: 'test.jpg'
      }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  describe 'GET /api/v1/activities' do
    context 'when user is not authenticated' do
      before { get '/api/v1/activities' }

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when user is authenticated' do
      before { get '/api/v1/activities', headers: authenticated_header }

      it 'returns activities' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET api/v1/activities/:id' do
    context 'when user is not authenticated' do
      before { get "/api/v1/activities/#{activity_id}" }

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the record exists and user authenticated' do
      before do
        get "/api/v1/activities/#{activity_id}", headers: authenticated_header
      end

      it 'returns the activity' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(activity_id)
        expect(json['name']).to eq(activity.name)
        expect(json['description']).to eq(activity.description)
        expect(json['track_url']).to eq(activity.track_url)
        expect(json['track_image_url']).to eq(activity.track_image_url)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist and user authenticated' do
      let(:activity_id) { 'not_an_id' }

      before do
        get "/api/v1/activities/#{activity_id}", headers: authenticated_header
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Activity/)
      end
    end
  end

  describe 'POST /api/v1/activities' do
    let(:valid_attributes) { { name: 'Test Activity', track: track_file, track_image: track_image_file } }

    context 'when user is not authenticated' do
      before { post '/api/v1/activities' }

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the request is valid and user authenticated' do
      before do
        post '/api/v1/activities',
             params: valid_attributes,
             headers: authenticated_header
      end

      it 'creates an activity' do
        expect(json['name']).to eq('Test Activity')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid and user authenticated' do
      before do
        post '/api/v1/activities',
             params: { description: 'Foobar' },
             headers: authenticated_header
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PATCH /api/v1/activities/:id' do
    let(:valid_attributes) { { name: 'Test Activity', track: track_file, track_image: track_image_file } }

    context 'when user is not authenticated' do
      before { patch "/api/v1/activities/#{activity_id}" }

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the record exists and user authenticated' do
      before do
        patch "/api/v1/activities/#{activity_id}",
            params: valid_attributes,
            headers: authenticated_header
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/activities/:id' do
    context 'when user is not authenticated' do
      before { delete "/api/v1/activities/#{activity_id}" }

      it 'returns empty body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when user is authenticated' do
      before do
        delete "/api/v1/activities/#{activity_id}",
               headers: authenticated_header
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
