class ApplicationController < ActionController::Base

  before_action :set_current_user
  before_action :require_login

  def set_current_user
    # finds user with session data and stores it if present
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    # allows only logged in user
     render json: { status: 'Login Required' }, status: :bad_request if @user.nil?
  end
end
