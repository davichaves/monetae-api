class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :update, :destroy]

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all

    render json: @exchange_rates
  end

  # GET /exchange_rates/1
  def show
    render json: @exchange_rate
  end

  # POST /exchange_rates
  def create
    @exchange_rate = ExchangeRate.new(exchange_rate_params)

    if @exchange_rate.save
      render json: @exchange_rate, status: :created, location: @exchange_rate
    else
      render json: @exchange_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exchange_rates/1
  def update
    if @exchange_rate.update(exchange_rate_params)
      render json: @exchange_rate
    else
      render json: @exchange_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exchange_rates/1
  def destroy
    @exchange_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange_rate
      @exchange_rate = ExchangeRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exchange_rate_params
      params.require(:exchange_rate).permit(:from_currency_id, :to_currency_id, :rate, :at)
    end
end
