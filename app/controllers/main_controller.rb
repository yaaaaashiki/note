class MainController < ApplicationController
  def index
    @root_tree = TreePost.all
    @posts = Post.page(params[:page]).order(id: :desc)
  end
end
