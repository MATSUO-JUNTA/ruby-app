Rails.application.routes.draw do
  root to: "posts#index"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:new, :create, :edit, :show, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'posts#search'
end
