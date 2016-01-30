class CurrentUsersController < ApplicationController

  def show
    render json: @current_user.to_json(except: [:id, :password_digest])
  end

end
