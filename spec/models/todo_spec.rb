# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.create(:list) }

  it 'is valid with valid attributes' do
    expect(described_class.new(user_id: user.id, list_id: list.id)).to be_valid
  end

  it 'is not valid without a list ID' do
    expect(described_class.new(user_id: user.id)).to be_invalid
  end

  it 'is not valid without a user ID' do
    expect(described_class.new(list_id: list.id)).to be_invalid
  end

  it 'is not valid if the user does not exist' do
    expect(described_class.new(user_id: -1, list_id: list.id)).to be_invalid
  end

  it 'is not valid if the list ID does not exist' do
    expect(described_class.new(user_id: user.id, list_id: -1)).to be_invalid
  end
end
