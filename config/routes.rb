Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
end
