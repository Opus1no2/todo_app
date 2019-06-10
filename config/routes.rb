# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api do
    namespace :v1 do
      resources :list do
        resources :todo
      end
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
