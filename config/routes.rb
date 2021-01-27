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

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
