require 'rails_helper'

RSpec.describe Presentation, type: :model do
  let(:user) { User.new(name: 'Peter') }
  let(:group) { Group.new(name: 'Sensorial', user: user) }

  it 'Presentation is created correctly' do
    presentation = Presentation.new(name: 'math', amount: 5, author: user)
    expect(presentation.valid?).to be true
  end

  it 'Presentation needs name, amount and author' do
    presentation = Presentation.new(amount: 5, author: user)
    expect(presentation.valid?).to be false
    presentation = Presentation.new(name: 'math', author: user)
    expect(presentation.valid?).to be false
    presentation = Presentation.new(name: 'math', amount: 5)
    expect(presentation.valid?).to be false
  end
end
