Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/show'
  get 'presentations/index'
  get 'presentations/new'
  root 'static_pages#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
