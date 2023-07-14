# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:email) { user.email }
  let(:password) { user.password }

  describe 'POST /auth/login' do
    let(:login_params) do
      {
        'email' => email,
        'password' => password
      }
    end

    before do
      user
      post '/auth/login', params: login_params
    end

    context 'when valid email and password is passed' do
      it 'responds with 200 status' do
        expect(response.status).to be 200
      end
    end

    context 'when invalid email or password is passed' do
      let(:email) { 'Invalid email' }
      let(:password) { 'Invalid password' }

      it 'responds with 401 status' do
        expect(response.status).to be 401
      end
    end
  end
end
