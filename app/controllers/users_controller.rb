class UsersController < ApplicationController
  skip_before_action :require_login, only:[:create]

  def create
    @user = User.new(user_params)
    @user.save!
    # stores saved user id in a session
    session[:user_id] = @user.id
    render json: @user.as_json
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:email, :password, :role)
  end
end
