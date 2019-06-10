# frozen_string_literal: true

# Todo class
class Todo < ApplicationRecord
  belongs_to :list
  belongs_to :user
end
