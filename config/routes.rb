Rails.application.routes.draw do
  root to: "tops#index"

  resources :sessions, only: [:new]
  resources :users, only: [:new, :create]
end
