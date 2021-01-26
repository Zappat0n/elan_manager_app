require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Peter') }
  it 'creates user correctly' do
    expect(user.valid?).to be true
  end

  it 'name must be unique' do
    user.save
    user2 = User.new(name: 'Peter')
    expect(user2.valid?).to be false
  end

  it 'name length is greater than 2' do
    user2 = User.new(name: 'X')
    expect(user2.valid?).to be false
  end
end
