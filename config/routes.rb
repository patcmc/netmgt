Rails.application.routes.draw do
  # Root route
  root "home#index"

  # Devise routes for user authentication
  devise_for :users

  get 'dashboard', to: 'dashboard#index'
end
