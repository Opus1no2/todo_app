# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    expect(described_class.new(user_id: user.id)).to be_valid
  end

  it 'is not valid without a user ID' do
    expect(described_class.new).to be_invalid
  end

  it 'is not valid without a valid user ID' do
    expect(described_class.new(user_id: -1)).to be_invalid
  end
end
