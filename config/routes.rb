Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :find_games, only: [:new, :index]
  resources :games, only: [:show, :new, :create, :destroy]
  resources :headers
  resources :payments, only: [:edit, :update]
  resources :scores
  resources :squares, only: [:update]
  resources :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
