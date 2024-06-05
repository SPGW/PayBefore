Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events

  resources :vaults, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :events,  only: [:index, :new, :create, :show]
end
