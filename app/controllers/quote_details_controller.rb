class QuoteDetailsController < ApplicationController
  before_action :set_quote_detail, only: [:show, :update, :destroy]

  # GET /quote_details
  def index
    @quote_details = QuoteDetail.all

    render json: @quote_details
  end

  # GET /quote_details/1
  def show
    render json: @quote_detail
  end

  # POST /quote_details
  def create
    @quote_detail = QuoteDetail.new(quote_detail_params)

    if @quote_detail.save
      render json: @quote_detail, status: :created, location: @quote_detail
    else
      render json: @quote_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quote_details/1
  def update
    if @quote_detail.update(quote_detail_params)
      render json: @quote_detail
    else
      render json: @quote_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quote_details/1
  def destroy
    @quote_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_detail
      @quote_detail = QuoteDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quote_detail_params
      params.require(:quote_detail).permit(:quote_no, :cost, :discount, :total_cost, :status, :belongs_to, :belongs_to, :belongs_to)
    end
end
