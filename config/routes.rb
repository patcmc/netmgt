Rails.application.routes.draw do
  # Root route
  root "home#index"

  # Devise routes for user authentication
  devise_for :users

  namespace :app do
    root to: 'dashboard#index', as: :dashboard
    resources :user_contacts, as: :contacts, path: 'contacts'
  end
end
