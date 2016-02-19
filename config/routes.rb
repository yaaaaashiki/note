Rails.application.routes.draw do
  namespace :api do
    resources :current_users, default: {format: :json}, only: :show
    resources :users
    resources :posts, default: {format: :json}
    resources :templates, default: {format: :json}
    resources :tree_posts, default: {format: :json}, only: :index
  end
  get 'login', to: 'login#index', as: 'login'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get "/service/posts.html", to: "service#posts"
  get "/service/post.html", to: "service#post"
  get "/service/posts/post_view.html", to: "service#post_view"
  get "/service/main.html", to: "service#main"
  get "/service/tree.html", to: "service#tree"
  get "/service/templates.html", to: "service#templates"
  get "/service/template.html", to: "service#template"

  get "/service/posts/show.html", to: "service#post_show"
  get "/service/posts/new.html", to: "service#post_new"

  get "/", to: "service#main", as: "top"
  get "/posts", to: "service#posts"
  get "/posts/:id", to: "service#post"
  get "/post", to: "service#post"
  get "/templates", to: "service#templates"
  get "/templates/new", to: "service#template"
  get "/templates/:id", to: "service#template"



end
