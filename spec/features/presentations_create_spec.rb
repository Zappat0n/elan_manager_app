require 'rails_helper'

RSpec.feature 'PresentationsCreates', type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    sign_in @user
  end

  it 'user can create an external presentation' do
    visit new_presentation_path
    page.find_by_id('presentation_new_name').fill_in with: 'Multiplication'
    page.find_by_id('presentation_new_amount').fill_in with: '9'
    click_button 'Create'
    expect(current_path).to eq(presentations_path)
    expect(page).to have_text('Presentation saved.')
  end

  it 'External presentation needs name' do
    visit new_presentation_path
    page.find_by_id('presentation_new_amount').fill_in with: '9'
    click_button 'Create'
    expect(current_path).to eq(new_presentation_path)
    expect(page).to have_text('Error saving presentation.')
  end

  it 'External presentation needs amount' do
    visit new_presentation_path
    page.find_by_id('presentation_new_name').fill_in with: 'Multiplication'
    click_button 'Create'
    expect(current_path).to eq(new_presentation_path)
    expect(page).to have_text('Error saving presentation.')
  end
end
