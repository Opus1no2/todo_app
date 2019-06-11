# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TodoController, type: :controller do
  describe '#create' do
    let (:user) { User.new(email: 't@test.com', password: 'password', uid: 't@test.com') }
    let (:list) { FactoryBot.create(:list) }

    context 'given the correct parameters' do
      it 'returns an http 200' do
        request.headers.merge! user.create_new_auth_token
        get :create, params: { list_id: list.id, name: 'test' }
        expect(response).to have_http_status(200)
      end

      it 'returns the new todo' do
        request.headers.merge! user.create_new_auth_token
        get :create, params: { list_id: list.id, name: 'test' }
        expect(JSON(response.body)).to include('name' => 'test')
      end
    end

    context 'given incorrect parameters' do
      it 'returns an http 422' do
        request.headers.merge! user.create_new_auth_token
        get :create, params: { list_id: 1, name: 'test'}
        expect(response).to have_http_status(422)
      end
    end
  end
end
