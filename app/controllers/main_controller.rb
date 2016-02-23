class MainController < ApplicationController
  def index
    @tree_posts = Post.tree
  end
end
