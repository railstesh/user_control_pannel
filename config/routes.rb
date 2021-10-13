Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login

  root 'logins#new'
end
