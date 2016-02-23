class MainController < ApplicationController
  def index
    @tree_posts = Post.tree
    @posts = Post.all.order(id: :desc)
  end
end
