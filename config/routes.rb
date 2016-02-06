Rails.application.routes.draw do
  resources :current_users, default: {format: :json}, only: :show
  resources :users
  resources :posts, default: {format: :json}
  resources :templates, default: {format: :json}
  resources :tree_posts, default: {format: :json}, only: :index
  get 'login', to: 'login#index', as: 'login'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get "/", to: "service#index", as: "top"
  get "/service/posts.html", to: "service#posts"
  get "/service/posts/show.html", to: "service#post_show"
  get "/service/posts/new.html", to: "service#post_new"
  get "/service/posts/post_view.html", to: "service#post_view"
  get "/service/main.html", to: "service#main"
  get "/service/tree.html", to: "service#tree"

end
