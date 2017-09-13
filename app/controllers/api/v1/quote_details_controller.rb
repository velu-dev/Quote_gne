module Api
  module V1
class QuoteDetailsController < ApplicationController
  before_action :set_quote_detail, only: [:show, :update, :destroy]

    def dashboard
        data = ProjectType.dashboard_process(params)
        render json: data
    end

    def invoice_page
      data = QuoteDetail.invoice_process(params)
      render json: data
    end
    def search 
      data = QuoteDetail.search(params[:search])
      render json: data
    end

  # GET /quote_details
  def index
    @quote_details = QuoteDetail.all.includes(:project_detail,:project_type,:user)

    render json: @quote_details
  end

  # GET /quote_details/1
  def show
    render json: @quote_detail
  end

  # POST /quote_details
  
  def create
    quoteno ="QNO"+(QuoteDetail.last.id + 1).to_s
    byebug
    service_detail_id=params[:service_detail].split(",").map{|i| i.to_i }
    @quote_detail = QuoteDetail.create!(quote_no: quoteno,cost: params[:cost],discount: params[:discount],total_cost: params[:total_cost],status: false,user_id: params[:user_id].to_i, currency_type_id: params[:currency_type_id].to_i, service_detail: service_detail_id,project_type_id: params[:project_type_id],project_detail_id: params[:project_detail_id].to_i)
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
      params.require(:quote_detail).permit(:quote_no, :cost, :discount, :total_cost, :status, :user_id, :currency_type_id, :project_detail_id, :service_detail_id)
    end
end
end
end