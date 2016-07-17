class SessionsController < ApplicationController
  skip_before_filter :authenticated

  def new
    @user = User.new
    if params[:create_user]
      @success
    end
  end

  def create
    @user = if User.email?(user_params[:email_or_name])
              User.find_by(email: user_params[:email_or_name])
            else
              User.find_by(name: user_params[:email_or_name])
            end
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      return redirect_to top_path
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
