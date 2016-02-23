class PostsController < ApplicationController
  def index
    search = Post.search(params[:q])
    @posts = search.result
    @posts = @posts.order(updated_at: :desc)
  end

end
