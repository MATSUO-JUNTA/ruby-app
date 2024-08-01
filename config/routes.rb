Rails.application.routes.draw do
  root to: "tops#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete 'logout', to: 'sessions#destroy'
end
