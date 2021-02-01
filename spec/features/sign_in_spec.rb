require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    visit users_sign_in_path
  end

  it 'user can login and it is redirected' do
    page.find_by_id('sign_in_name').fill_in with: @user.name
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end

  it 'wrong user can not login' do
    page.find_by_id('sign_in_name').fill_in with: 'John'
    click_button 'Log in'
    expect(current_path).to eq(users_sign_in_path)
    expect(page).to have_no_text('Signed in successfully.')
  end
end
