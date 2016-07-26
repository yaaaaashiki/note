require 'html/pipeline'
class PostsController < ApplicationController
  before_action :set_post, only: [:destroy, :show]
  def index
    @search = Post.search(params[:q])
    @posts = @search.result.page(params[:page])
    @posts = @posts.order(updated_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

  private

  def set_post
    @post = Post.find params[:id]
  end
end
