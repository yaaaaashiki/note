class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user
  before_filter :authenticated

  layout "admin"

  def authenticated
    if session[:admin_user_id]
      begin
        @current_user = AdminUser.find_by(id: session[:admin_user_id])
        Thread.current[:admin_user_id] = session[:admin_user_id]
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    redirect_to new_admin_session_path unless @current_user
  end

  private

  def set_user
    if session[:admin_user_id]
      @current_user = AdminUser.find session[:admin_user_id]
    end
  end

  def current_user
    @current_user
  end
end
