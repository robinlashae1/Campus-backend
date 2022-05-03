class ServicesController < ApplicationController
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
