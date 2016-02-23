class MainController < ApplicationController
  def index
    @tree_posts = Post.tree
    @posts = Post.page(params[:page]).order(id: :desc)
  end
end
