class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user
  before_filter :authenticated

  def authenticated
    if session[:user_id]
      begin
        @current_user = User.find_by(id: session[:user_id])
        Thread.current[:user_id] = session[:user_id]
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    redirect_to new_session_path unless @current_user
  end

  private

  def set_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  def current_user
    @current_user
  end
end
