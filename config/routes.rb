# mj: don't forget to 'rake js:routes'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
  inertia 'contact' => 'Contact'
end
