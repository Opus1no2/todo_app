# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :todo do
    user
    list
    name { Faker::Space.star }
  end

  factory :list do
    user
    name { Faker::Space.constellation }
  end

  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
  end
end
