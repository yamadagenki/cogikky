Rails.application.routes.draw do
  root 'users/home#index'

  get '/auth/:provider/callback',    to: 'users/user#create',       as: :users_auth_callback
  get '/auth/failure',               to: 'users/user#auth_failure', as: :users_auth_failure
  namespace :users do
    get '/auth/destroy',    to: 'user#destroy',       as: :auth_destroy
    resources :categories, only: [:show]
    resources :wishes, only: [:show]
    resources :givings, only: [:create, :destroy, :new]
  end
end
