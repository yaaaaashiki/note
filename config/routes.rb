Rails.application.routes.draw do
  resources :users
  resources :posts, default: {format: :json}
  get 'login', to: 'login#index', as: 'login'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get "/", to: "service#index", as: "top"
  get "/service/posts.html", to: "service#posts"
  get "/service/posts/show.html", to: "service#post_show"
  get "/service/post.html", to: "service#post"
  get "/service/main.html", to: "service#main"
  get "/service/tree.html", to: "service#tree"

end
