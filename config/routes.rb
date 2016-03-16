Rails.application.routes.draw do
  root 'users/home#index'

  namespace :users do
    resources :categories, only: [:show]
  end
end
