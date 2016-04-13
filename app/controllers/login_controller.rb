class LoginController < ApplicationController
  skip_before_filter :authenticated

  def index
    if params[:create_user]
      @success
    end
  end

  def sign_up
    @user = User.new
  end

  def create_user
    get_params = user_params
    if get_params[:password] == get_params[:password_agein]
      get_params.delete :password_agein
      @user = User.new(get_params)
      if @user.save
        redirect_to login_path(create_user: :success) and return
      else
        render :sign_up
      end
    else
      get_params.delete :password_agein
      @user = User.new(get_params)
      render :sign_up
    end
  end

  def login
    user = User.find_by(name: params[:login_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      return redirect_to top_path
    end
    render 'index'
  end

  def logout
    reset_session
    redirect_to login_path
  end


  private
  def user_params
    params.require(:user).permit(
      :id, :name, :email, :password, :password_agein
    )
  end

end
