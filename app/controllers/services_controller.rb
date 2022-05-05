class ServicesController < ApplicationController
    respond_to :json
    before_action :cors_preflight_check
    after_action :cors_set_access_control_headers

    def index
        render json: Service.all
    end
    def create
        service = @current_user.service.create!(service_params)
    render json: service, status: :created
    end
    def show
        service = find_service
        render json: service, include: ['service_category']
    end
    private
    def service_params
        params.permit(:name)
    end
    def find_service
        Service.find_by(id: params[:id])
    end
end
