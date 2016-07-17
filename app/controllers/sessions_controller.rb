class SessionsController < ApplicationController
  skip_before_filter :authenticated

  def new
    @user = User.new
    if params[:create_user]
      @success
    end
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      return redirect_to top_path
    end
    @user = User.new
    render :new
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password
    )
  end

end
