require 'rails_helper'

RSpec.feature "GroupsCreates", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    sign_in @user
  end

  it 'user can create a group' do
    visit new_group_path
    page.find_by_id('group_new_name').fill_in with: "Math"
    click_button 'Create'
    expect(current_path).to eq(groups_path)
    expect(page).to have_text('Group saved.')
  end

  it 'Group needs name' do
    visit new_group_path
    click_button 'Create'
    expect(current_path).to eq(new_group_path)
    expect(page).to have_text('Error saving group.')
  end
end
