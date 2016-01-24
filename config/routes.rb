Rails.application.routes.draw do
  resources :users
  get 'login', to: 'login#index', as: 'login'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get "/", to: "service#index", as: "top"

end
