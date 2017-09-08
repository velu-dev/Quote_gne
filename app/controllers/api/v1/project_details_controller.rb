module Api
  module V1
class ProjectDetailsController < ApplicationController
  before_action :set_project_detail, only: [:show, :update, :destroy]

  # GET /project_details
  def index
    @project_details = ProjectDetail.all

    render json: @project_details
  end
  
  # GET /project_details/1
  def show
    render json: @project_detail
  end

  # POST /project_details
  def create
    @project_detail = ProjectDetail.new(project_detail_params)

    if @project_detail.save
      render json: @project_detail, status: :created, location: @project_detail
    else
      render json: @project_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_details/1
  def update
    if @project_detail.update(project_detail_params)
      render json: @project_detail
    else
      render json: @project_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_details/1
  def destroy
    @project_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_detail
      @project_detail = ProjectDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_detail_params
      params.require(:project_detail).permit(:project_name, :description, :status, :belongs_to, :belongs_to)
    end
end
end
end