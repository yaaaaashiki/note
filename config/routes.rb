Rails.application.routes.draw do

  get "/", to: "main#index", as: "top"
  resources :posts

  namespace :api do
    resources :current_users, default: {format: :json}, only: :show
    resources :users
    resources :posts, default: {format: :json}
    resources :templates, default: {format: :json}
    resources :tree_posts, default: {format: :json}, only: :index
  end

  # user login 関連
  get 'login', to: 'login#index', as: 'login'
  get 'sign_up', to: "login#sign_up", as: "sign_up"
  get 'logout', to: 'login#logout'
  post 'login/login'
  post 'create_user', to: "login#create_user", as: "create_user"



  # angular 関連 いずれ消したい

  get "/service/posts.html", to: "service#posts"
  get "/service/post.html", to: "service#post"
  get "/service/posts/post_view.html", to: "service#post_view"
  get "/service/main.html", to: "service#main"
  get "/service/tree.html", to: "service#tree"
  get "/service/templates.html", to: "service#templates"
  get "/service/template.html", to: "service#template"

  get "/service/posts/show.html", to: "service#post_show"
  get "/service/posts/new.html", to: "service#post_new"

  # get "/posts", to: "service#posts"
  # get "/posts/:id", to: "service#posts"
  # get "/posts/new", to: "service#post"
  # get "/posts/:id/edit", to: "service#post"
  get "/templates", to: "service#templates"
  get "/templates/new", to: "service#template"
  get "/templates/:id", to: "service#template"




end
