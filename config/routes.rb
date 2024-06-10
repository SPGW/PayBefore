Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events

  resources :vaults, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :events, only: [:index, :new, :create, :show]
  resources :donations, only: [:create]

  # get '/donations/create/:amount', to: 'donations#create'
  get '/donations/checkout/:id', to: 'donations#checkout', as: 'donation_checkout'
  get '/donations/success/:id', to: 'donations#success', as: 'donation_success'

  # dashboard
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
end
