Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  namespace :users do
    resources :foodmoods, only: [:index, :create]
  end

  resources :restaurants, only: [:index, :show] do
    resources :suggestions, only: [:show, :new, :create, :update, :edit]
    resources :reviews, only: [:new, :create]
  end

  namespace :foodmoods do
    resources :restaurants, only: [:index, :create, :update]
  end

  resources :users, only: [:show, :index, :update, :edit]
  # get "users/:id/edit", to: "users#edit"

  get "/exist", to: "conversations#exist"
  resources :conversations, only: [:index, :create, :show, :destroy] do
    resources :messages, only: [:new, :create]
  end

  resources :likes, only: [:create]
  get "/match", to: "likes#match"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
