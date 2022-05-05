class UsersController < ApplicationController
    # skip_before_action :authorize, only: :create
    respond_to :json
before_action :cors_preflight_check
after_action :cors_set_access_control_headers

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def update
      # @user = User.find_by(id: params[:user_id])
      find_user
        @user.update(user_params)
        render json: @user, status: :ok
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user, include: ['user_services','school']
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      end

    private
    def find_user
      @user = User.find_by(id: params[:id])
  end

    def user_params
        params.permit(:username, :password, :password_confirmation, :name, :description, :id, :is_tech, :profile_picture)
    end
end
