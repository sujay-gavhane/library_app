# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LibrariesController, type: :request do
  let(:request_headers) { { 'Authorization' => token } }
  let(:secret_key) { Rails.application.secrets.secret_key_base.to_s }
  let(:token) { JWT.encode({ user_id: user.id }, secret_key) }
  let(:user) { FactoryBot.create(:user) }
  let(:email) { user.email }
  let(:password) { user.password }
  let(:library_name) { 'Library 1' }
  let(:description) { 'description' }
  let(:location) { 'Georgia' }
  let(:response_body) { JSON.parse(response.body) }

  describe 'POST /api/v1/libraries' do
    let(:library_params) do
      {
        'name' => library_name,
        'description' => description,
        'location' => location
      }
    end

    before do
      post '/api/v1/libraries', params: library_params, headers: request_headers
    end

    context 'when valid params passed' do
      it 'responds with 200 status' do
        expect(response.status).to be 200
      end
    end

    context 'when invalid params are passed' do
      let(:library_name) { '' }
      let(:expected_error) do
        {
          "name"=>["can't be blank"]
        }
      end

      it 'responds with 422 status' do
        expect(response.status).to be 422
        expect(response.body).to eq expected_error.to_json
      end
    end
  end

  describe 'GET /api/v1/libraries' do
    let(:libraries) { create_list(:library, 3) }

    context 'with valid params' do
      before do
        libraries
        get "/api/v1/libraries", headers: request_headers
      end

      it 'responds with 200 status, lists records' do
        expect(response.status).to be 200
        expect(response_body).not_to be_nil
        expect(response_body['data'].count).to eq(3)
      end
    end
  end

  describe 'GET /api/v1/libraries/{id}' do
    let(:libraries) { create_list(:library, 3) }

    context 'with valid params' do
      before do
        libraries
        get "/api/v1/libraries/#{libraries.first.id}", headers: request_headers
      end

      it 'responds with 200 status, lists records' do
        expect(response.status).to be 200
        expect(response_body).not_to be_nil
      end
    end

    context 'with Invalid params' do
      before do
        libraries
        get "/api/v1/libraries/#{Random.uuid}", headers: request_headers
      end

      it 'responds with 404 status, record_not_found' do
        expect(response_body['status']).to eq 404
        expect(response_body['message']).to eq('record_not_found')
      end
    end
  end

  describe 'PUT /api/v1/libraries/{id}' do
    let(:libraries) { create_list(:library, 3) }
    let(:library_params) {
      { :name => 'test update' }
    }

    context 'with valid params' do
      before do
        libraries
        put "/api/v1/libraries/#{libraries.first.id}", params: library_params, headers: request_headers
      end

      it 'responds with 200 status, updates record' do
        expect(response.status).to be 200
        expect(response_body['object']['data']['attributes']['name']).to eq('test update')
      end
    end

    context 'with Invalid params' do
      let(:library_params) {
        { :name => '' }
      }
      let(:expected_error){
        {"name"=>["can't be blank"]}
      }

      before do
        libraries
        put "/api/v1/libraries/#{libraries.first.id}", params: library_params, headers: request_headers
      end

      it 'responds with 404 status, do not update records' do
        expect(response_body).to eq expected_error
      end
    end
  end

  describe 'DELETE /api/v1/libraries/{id}' do
    let(:libraries) { create_list(:library, 3) }

    context 'with valid params' do
      before do
        libraries
        delete "/api/v1/libraries/#{libraries.first.id}", headers: request_headers
      end

      it 'responds with 200 status, deletes records' do
        expect(response.status).to be 200
        expect(response_body['status']).to eq('deleted')
      end
    end

    context 'with Invalid params' do
      before do
        libraries
        delete "/api/v1/libraries/#{Random.uuid}", headers: request_headers
      end

      it 'responds with 404 status, lists records' do
        expect(response_body['status']).to eq 404
        expect(response_body['message']).to eq('record_not_found')
      end
    end
  end
end
