class PostsController < ApplicationController
  before_action :set_post, only: [:update, :show, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
  def index
    @posts = Post.all
    render json: @posts.to_json(include: [:created_user, :updated_user])
  end

  def show
    render json: @post.to_json(include: [:created_user, :updated_user])
  end

  def new

  end

  def create
    post = Post.create(post_params)
    render json: post, status: 201
  end

  def edit

  end

  def update
    @post.update(post_params)
    render json: @post, status: 201
  end

  def destroy
    @post.destroy
    render nothing: true, status: 204
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
