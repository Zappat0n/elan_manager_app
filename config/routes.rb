Rails.application.routes.draw do
  root 'static_pages#index'

  resources :groups, only: [:index, :new, :create, :show, :destroy]
  resources :presentations, only: [:new, :create, :index, :destroy]

  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/:id', to: 'devise/sessions#create'
    delete '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/sign_up', to: 'devise/registrations#new'
    post '/users/:id', to: 'devise/registrations#create'
    get '/users/edit', to: 'devise/registrations#edit'
    delete '/users', to: 'devise/registrations#destroy'
    patch '/users/', to: 'registrations#update'
  end
end
