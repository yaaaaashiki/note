class Api::CurrentUsersController < ApplicationController

  def show
    render json: @current_user.to_json(except: :password_digest)
  end

end
