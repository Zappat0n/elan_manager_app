require 'rails_helper'

RSpec.describe 'SignOuts', type: :request do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    post users_sign_in_path, params: { id: @user.id }
  end

  it 'user can logout and it is redirected' do
    delete '/users/sign_out'
    expect(response).to redirect_to(root_path)
    follow_redirect!

    expect(response.body).to include('Signed out successfully.')
  end
end
