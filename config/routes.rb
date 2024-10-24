Rails.application.routes.draw do
  devise_for :teachers  # This creates routes for Devise-based teacher authentication

  resources :students  # This generates CRUD routes for students

  root to: 'students#index'  # Redirect to the student list after login
end
