class Admin::AdminUsersController < AdminController
  before_action :set_user, only: [:create]

  def show
  end

  def new
  end

  def create
    @user.create_admin_user
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_admin_user
    @admin_user = AdminUser.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :id, :name, :email, :password, :password_agein
    )
  end
end
