Rails.application.routes.draw do
  root 'users/home#index'

  namespace :users do
    resources :categories, only: [:show]
    resources :wishes, only: [:show]
  end
end
