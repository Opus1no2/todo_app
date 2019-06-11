# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without an email' do
    expect(described_class.new(password: 'password')).to be_invalid
  end

  it 'is not valid without a valid email' do
    expect(described_class.new(email: 'test.com', password: 'password')).to be_invalid
  end

  it 'is not valid without a password' do
    expect(described_class.new(email: 't@test.com')).to be_invalid
  end

  it 'is valid with valid attributes' do
    expect(described_class.new(email: 't@test.com', password: 'password')).to be_valid
  end
end
