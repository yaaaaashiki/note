class MainController < ApplicationController
  def index
    @root_tree = TreePost.all
    @posts = Post.page(params[:page]).per(5).order(id: :desc)
  end
end
