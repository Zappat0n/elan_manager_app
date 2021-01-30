Rails.application.routes.draw do
  root 'static_pages#index'

  resources :groups, only: [:index, :new, :create, :show, :destroy]
  resources :presentations, only: [:new, :create, :index, :destroy]

  devise_for :users, skip: :all

  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/:id', to: 'devise/sessions#create'
    delete '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/sign_up', to: 'devise/registrations#new'
    post '/users', to: 'devise/registrations#create', as: :users
    get '/users/:id/edit', to: 'devise/registrations#edit', as: :edit_user
    delete '/users/:id', to: 'devise/registrations#destroy'
    put '/users/:id', to: 'registrations#update', as: :user
  end

end
