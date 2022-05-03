class SchoolsController < ApplicationController
    def index
        render json: School.all
    end
    def create
        school = @current_user.school.create!(school_params)
        render json: school, status: :created
    end
    def show
        school = find_school
        render json: school, include: :services
    end
    def destroy
        school = find_school
        school.destroy
        render json: {}, status: :no_content
    end
    private
    def school_params
        params.permit(:name,:city,:state,:image_url)
    end
    def find_school
        School.find_by(id: params[:id])
    end
end
