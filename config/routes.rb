Rails.application.routes.draw do
  root to: "tops#index"

  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end
