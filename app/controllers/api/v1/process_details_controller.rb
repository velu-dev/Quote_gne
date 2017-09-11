module Api
  module V1
class ProcessDetailsController < ApplicationController
  before_action :set_process_detail, only: [:show, :update, :destroy]

  # GET /process_details
  def index
    @process_details = ProcessDetail.all

    render json: @process_details
  end

  def processdata
    parant_process = params[:process_id].present? ? ProcessDetail.find(params[:process_id]) : ProcessDetail.where.not(parent_process_id: nil)
    child_process = params[:process_id].present? ? ProcessDetail.where(parent_process_id: params[:process_id].to_i) : 0
    data={
      :parant_process => parant_process,
      :child_process => child_process
    }
    render json: data
  end

  # GET /process_details/1
  def show
    render json: @process_detail
  end

  # POST /process_details
  def create
    # id = params[:id].present? ? params[:id] : nil
    # unless params[:parent_process_id].present? 
    #   project_detail_id=[]
    #   project_detail_id = ProcessDetail.find(id).project_detail
    #   project_detail_id << id.to_i
    #   @process_detail= ProcessDetail.find(id).update!(project_detail: project_detail_id)
    #   render json: @project_detail
    # else
    #   byebug
    #   a=[]
    #   a<< params[:project_detail]
    #   @process_detail = ProcessDetail.new(process_detail_params)
    #    @process_detail.project_detail = a
    #   if @process_detail.save
    #     render json: @process_detail, status: :created, location: @process_detail
    #   else
    #     render json: @process_detail.errors, status: :unprocessable_entity
    #   end
    # end
    @process_detail = ProcessDetail.new(process_detail_params)

    if @process_detail.save
      render json: @process_detail, status: :created, location: @process_detail
    else
      render json: @process_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /process_details/1
  def update

    if @process_detail.update(process_detail_params)
      render json: @process_detail
    else
      render json: @process_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /process_details/1
  def destroy
    @process_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_detail
      @process_detail = ProcessDetail.find(params[:id])
    end
 
    # Only allow a trusted parameter "white list" through.
    def process_detail_params
      params.require(:process_detail).permit(:process_name, :parent_process_id, :cost, :currency_type_id, :uom_detail_id)#, :project_detail
    end
end
end
end