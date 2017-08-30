class CurrencyTypesController < ApplicationController
  before_action :set_currency_type, only: [:show, :update, :destroy]

  # GET /currency_types
  def index
    @currency_types = CurrencyType.all

    render json: @currency_types
  end

  # GET /currency_types/1
  def show
    render json: @currency_type
  end

  # POST /currency_types
  def create
    @currency_type = CurrencyType.new(currency_type_params)

    if @currency_type.save
      render json: @currency_type, status: :created, location: @currency_type
    else
      render json: @currency_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currency_types/1
  def update
    if @currency_type.update(currency_type_params)
      render json: @currency_type
    else
      render json: @currency_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currency_types/1
  def destroy
    @currency_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_type
      @currency_type = CurrencyType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currency_type_params
      params.require(:currency_type).permit(:type_name, :description)
    end
end
