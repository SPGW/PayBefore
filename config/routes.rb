Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events

  resources :vaults, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check


end
