class ProcessDetailsController < ApplicationController
  before_action :set_process_detail, only: [:show, :update, :destroy]

  # GET /process_details
  def index
    @process_details = ProcessDetail.all

    render json: @process_details
  end

  # GET /process_details/1
  def show
    render json: @process_detail
  end

  # POST /process_details
  def create
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
      params.require(:process_detail).permit(:process_name, :parent_process_id, :cost, :belongs_to, :belongs_to, :belongs_to)
    end
end
