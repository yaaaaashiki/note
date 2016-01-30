class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  protect_from_forgery except: [:create]
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def new

  end

  def create
    puts "-" * 10
    post = Post.create(post_params)
    puts post.errors
    render json: post, status: 201
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(
      :id, :path, :body,
      :_destroy,
      :created_user_id, :updated_user_id,
      :created_at, :updated_at, :deleted_id,
    )
  end

end
