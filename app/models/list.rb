# frozen_string_literal: true

# Todo lists
class List < ApplicationRecord
  belongs_to :user
  has_many :todos
end
