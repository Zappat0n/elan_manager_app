Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
