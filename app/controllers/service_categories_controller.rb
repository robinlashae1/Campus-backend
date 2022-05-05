class ServiceCategoriesController < ApplicationController
    respond_to :json
    before_action :cors_preflight_check
    after_action :cors_set_access_control_headers
   
    def index
        render json: ServiceCategory.all
    end
    def create
        serviceCategory = ServiceCategory.create!(school_params)
        render json: serviceCategory, status: :created
    end
    def show
        serviceCategory = find_serviceCategory
        render json: serviceCategory, include: ['user_service']
    end
    def destroy
        serviceCategory = find_serviceCategory
        serviceCategory.destroy
        render json: {}, status: :no_content
    end
    private
    def serviceCategory_params
        params.permit(:name,:service_id)
    end
    def find_serviceCategory
        ServiceCategory.find_by(id: params[:id])
    end
end
