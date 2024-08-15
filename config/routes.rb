Rails.application.routes.draw do
  root to: "posts#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:new, :create, :edit, :update]
  delete 'logout', to: 'sessions#destroy'
end
