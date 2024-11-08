Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root route
  root "home#index"
end
