class Api::PostsController < ApplicationController
  before_action :set_post, only: [:update, :show, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
  def index
    if params[:q].present?
      search = Post.search(params[:q])
      @posts = search.result
    else
      @posts = Post.all
    end
    @posts = @posts.order(updated_at: :desc)
    render json: @posts.to_json(
      include: [
        :tags,
        {created_user: {except: :password_digest}},
        {updated_user: {except: :password_digest}},
      ],
        methods: [
          :to_json_created_at,
          :to_json_updated_at
      ]
    )
  end

  def show
    render json: @post.to_json(include: [:tags, updated_user: {except: :password_digest}])
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
       :deleted_at,
    )
  end

end
