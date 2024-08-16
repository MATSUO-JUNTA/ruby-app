Rails.application.routes.draw do
  root to: "posts#index"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:new, :create, :edit, :show, :update, :destroy]
  delete 'logout', to: 'sessions#destroy'
end
