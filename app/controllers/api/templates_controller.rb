class Api::TemplatesController< ApplicationController
  before_action :set_template, only: [:update, :show, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
  def index
    @templates = Template.all
    render json: @templates.to_json(
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
    render json: @template.to_json(include: [created_user: {except: :password_digest}, updated_user: {except: :password_digest}])
  end

  def create
    template = Template.create(template_params)
    render json: template, status: 201
  end

  def update
    @template.update(template_params)
    render json: @tempalte, status: 201
  end

  def destroy
    @template.destroy
    render nothing: true, status: 204
  end

  private
  def set_template
    @template = Template.find params[:id]
  end

  def template_params
    params.require(:template).permit(
      :id, :path, :body,
      :_destroy,
      :created_user_id, :updated_user_id,
      :created_at, :updated_at, :deleted_id,
    )
  end

end
