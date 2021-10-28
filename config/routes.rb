# If you're changing the routes without running the development
# server, be sure to run:
# 'bin/rake js_from_routes:generate'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Pages (handled by pages_controller.rb)
  root 'pages#index', export: true
  get '/contact', to: 'pages#contact', export: true

  # Authentication (handled by authentication_controller.rb)
  scope module: 'authentication', export: true do
    get '/login', to: 'login#index'
    get '/register', to: 'register#index'
  end

  # Dashboard (handled by dashboard_controller.rb)
  namespace :dashboard, export: true do
    root to: 'pages#index'
  end
end
