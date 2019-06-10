# frozen_string_literal: true

# User class
class User < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :lists
  has_many :todos, through: :lists

  after_create :create_default_list

  def create_default_list
    List.create!(user_id: id, name: 'first')
  end
end
