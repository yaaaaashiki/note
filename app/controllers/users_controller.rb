class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    render json: @user
  end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   get_params = user_params
  #   if get_params[:password] == get_params[:password_agein]
  #     get_params.delete :password_agein
  #     @user = User.new(get_params)
  #     if @user.save
  #       redirect_to new_sessions_path(create_user: :success) and return
  #     else
  #       render :new
  #     end
  #   else
  #     get_params.delete :password_agein
  #     @user = User.new(get_params)
  #     render :new
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(
      :id, :name, :email, :password, :password_agein
    )
  end
end
