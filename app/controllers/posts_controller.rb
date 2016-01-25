class PostsController < ApplicationController
  before_action :set_post, only: [:show, :create, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show

  end

  def new

  end

  def create
    post = Post.create!(post_params)
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
