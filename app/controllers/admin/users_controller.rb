class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if user_params[:password] == params[:user][:password_agein]
      @user = User.new user_params
      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    else
      @user = User.new user_params
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
    )
  end
end
