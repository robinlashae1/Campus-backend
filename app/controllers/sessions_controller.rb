class SessionsController < ApplicationController
  respond_to :json
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      render json: user
  else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
  end
end

  def destroy
    session.delete :user_id
    head :no_content
end
end

