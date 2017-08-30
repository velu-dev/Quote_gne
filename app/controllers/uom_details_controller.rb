class UomDetailsController < ApplicationController
  before_action :set_uom_detail, only: [:show, :update, :destroy]

  # GET /uom_details
  def index
    @uom_details = UomDetail.all

    render json: @uom_details
  end

  # GET /uom_details/1
  def show
    render json: @uom_detail
  end

  # POST /uom_details
  def create
    @uom_detail = UomDetail.new(uom_detail_params)

    if @uom_detail.save
      render json: @uom_detail, status: :created, location: @uom_detail
    else
      render json: @uom_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /uom_details/1
  def update
    if @uom_detail.update(uom_detail_params)
      render json: @uom_detail
    else
      render json: @uom_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /uom_details/1
  def destroy
    @uom_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uom_detail
      @uom_detail = UomDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def uom_detail_params
      params.require(:uom_detail).permit(:uom_type, :cost, :description)
    end
end
