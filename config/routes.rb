Rails.application.routes.draw do
  root 'users/home#index'

  get '/auth/:provider/callback',    to: 'users/user#create',       as: :users_auth_callback
  get '/auth/failure',               to: 'users/user#auth_failure', as: :users_auth_failure
  namespace :users do
    get '/mypage',          to: 'user#mypage',       as: :user_mypage
    get '/mypage/edit',            to: 'user#edit',         as: :user_edit
    get '/mypage/:hashed_id',      to: 'user#show',         as: :user_show
    get '/auth/destroy',    to: 'user#destroy',      as: :auth_destroy
    resources :wishes do
      collection do
        post :confirm
      end
    end
    resources :messages
    resources :categories, only: [:show, :index]
    resources :givings, only: [:create, :destroy, :new, :index]
  end


  get 'terms' => 'pages#show', id: 'terms'
end
