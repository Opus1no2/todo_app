# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :controller do
  context 'given correct parameters' do
    it 'returns an http 200' do
      get :create, params: { user: { email: 'test@test.com', password: 'password'  }}
      expect(response).to have_http_status(200)
    end

    it 'returns the new User' do
      get :create, params: { user: { email: 'test@test.com', password: 'password'  }}
      expect(JSON(response.body)).to include('email' => 'test@test.com')
    end
  end

  context 'given incorrect parameters' do
    it 'returns an http 422' do
      get :create, params: { user: { email: '', password: '' }}
      expect(response).to have_http_status(422)
    end
  end
end

