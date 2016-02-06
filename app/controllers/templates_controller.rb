class TemplatesController< ApplicationController
  before_action :set_post, only: [:update, :show, :destroy]
  protect_from_forgery except: [:create, :update, :destroy]
  def index
    @templates = Template.all
    render json: @templates.to_json
  end

  private
  def set_template
    @template = Template.find params[:id]
  end

  def tepmlate_params
    params.require(:template).permit(
      :id, :path, :body,
      :_destroy,
      :created_user_id, :updated_user_id,
      :created_at, :updated_at, :deleted_id,
    )
  end

end
