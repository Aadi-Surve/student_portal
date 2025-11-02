Rails.application.routes.draw do
  # Swagger API Documentation
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Devise authentication
  devise_for :users

  # Default root page (web app home)
  root 'students#index'

  # Web interface routes (HTML)
  resources :students
  resources :teachers
  resources :courses
  resources :grades

  # JSON API routes (v1)
  namespace :api do
    namespace :v1 do
      resources :students
      resources :teachers
      resources :courses
      resources :grades
    end
  end

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end
