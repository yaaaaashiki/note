class Api::TagsController < ApplicationController
  before_action :set_tag, only: [:update, :show, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
  def index
    if params[:q].present?
      search = Tag.search(params[:q])
      @tags = search.result
    else
      @tags = Tag.all
    end
    @tags = @tags.order(updated_at: :desc)
    render json: @tags.to_json(
      include: [
        {created_user: {except: :password_digest}},
        {updated_user: {except: :password_digest}}
      ],
        methods: [
          :to_json_created_at,
          :to_json_updated_at
      ]
    )
  end

  def show
    render json: @tag.to_json(include: [created_user: {except: :password_digest}, updated_user: {except: :password_digest}])
  end

  def new

  end

  def create
    tag = Tag.create(tag_params)
    render json: tag, status: 201
  end

  def edit

  end

  def update
    @tag.update(tag_params)
    render json: @tag, status: 201
  end

  def destroy
    @tag.destroy
    render nothing: true, status: 204
  end

  private
  def set_tag
    @tag = Tag.find params[:id]
  end

  def post_params
    params.require(:tag).permit(
      :id, :name,
      :_destroy,
      :created_user_id, :updated_user_id,
       :deleted_at,
    )
  end

end
