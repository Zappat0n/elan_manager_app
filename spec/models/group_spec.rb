require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Peter') }

  it 'groups are created correctly' do
    group = Group.new(name: 'Sensorial', user: user)
    expect(group.valid?).to be true
  end

  it 'groups need user' do
    group = Group.new(name: 'Sensorial')
    expect(group.valid?).to be false
  end
end
