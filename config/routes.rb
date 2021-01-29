Rails.application.routes.draw do
  get 'groups/index'
  #get 'groups/new'
  #post 'groups/:id', to: 'groups#create'
  #get 'groups/show'
  get 'presentations/index'
  get 'presentations/new'
  root 'static_pages#index'

  resources :groups
  resources :presentations

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

  #devise_for :users, controllers: { registrations: 'registrations' }
end
