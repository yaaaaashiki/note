class Admin::SessionsController < AdminController
  skip_before_filter :authenticated

  def new
    @user = User.new
  end

  def create
    user = if User.email?(user_params[:email_or_name])
              User.find_by(email: user_params[:email_or_name])
            else
              User.find_by(name: user_params[:email_or_name])
            end
    if user.admin? && user.authenticate(user_params[:password])
      @admin_user = user.admin_user
      session[:admin_user_id] = @admin_user.id
      # return redirect_to top_path
      return redirect_to admin_users_path
    end
    @user = User.new user_params
    render :new
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email_or_name, :password
    )
  end

end
