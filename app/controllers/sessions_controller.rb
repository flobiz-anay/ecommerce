class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
    # sets up user.id sessions
      session[:user_id] = user.id
      render json: { status: 'Logged in successfully' }
    else
      render json: { status: 'Login unsuccessful' }, status: :bad_request
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    render json: { status: 'Logged out successfully' }
  end

end
