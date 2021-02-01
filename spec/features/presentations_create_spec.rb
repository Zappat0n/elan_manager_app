require 'rails_helper'

RSpec.feature "PresentationsCreates", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    sign_in users_sign_in_path
  end

  it 'user can create an external presentation' do
    visit new_presentation_path

    fill_in "name",	with: "Multiplication"
    click_button 'Create'
    expect(current_path).to eq(presentations_path)
    #expect(page).to have_text('Signed in successfully.')
  end
end
