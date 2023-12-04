Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  namespace :users do
    resources :foodmoods, only: [:index, :create]
  end

  resources :restaurants, only: [:index, :show] do
    resources :suggestions, only: [:show, :new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :index, :update, :edit]
  # get "users/:id/edit", to: "users#edit"

  resources :conversations, only: [:index] do
    resources :messages, only: [:new, :create]
  end

  resources :likes, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
