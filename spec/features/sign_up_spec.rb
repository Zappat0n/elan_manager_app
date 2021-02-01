require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  before :each do
    @user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    visit users_sign_up_path
  end

  it 'user can Sign up and it is redirected' do
    page.find_by_id('sign_up_name').fill_in with: @user.name
    click_button 'Sign up'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'name can not be empty' do
    click_button 'Sign up'
    expect(current_path).to eq(users_path)
    expect(page).to have_text("Name can't be blank")
  end

  it 'name must be unique' do
    @user2 = User.create(name: 'Peter', email: 'x@x.com', password: '123456')

    page.find_by_id('sign_up_name').fill_in with: @user.name
    click_button 'Sign up'
    expect(page).to have_text('Name has already been taken')
  end
end
