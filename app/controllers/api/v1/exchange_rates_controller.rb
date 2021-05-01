class Api::V1::ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :update, :destroy]

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all

    render json: @exchange_rates.count
  end

  # GET /exchange_rates/1
  def show
    render json: @exchange_rate
  end

  # POST /exchange_rates
  def create
    start_date = Date.parse('2020-04-15')
    end_date = Date.parse('2020-04-27')

    (start_date..end_date).each do |day|
      exchange_rate = JSON.parse(RestClient.get "http://data.fixer.io/api/#{day.strftime("%Y-%m-%d")}?access_key=84c960ca7f193d2306f7ac23196f9db9")

      exchange_rate["rates"].each_with_index do |rate, index|
        @new_exchange_rate = ExchangeRate.new
        @new_exchange_rate.base_currency = Currency.find_by(code: exchange_rate["base"])
        @new_exchange_rate.to_currency = Currency.find_by(code: rate[0])
        @new_exchange_rate.from_date = exchange_rate["date"].to_datetime
        @new_exchange_rate.rate = rate[1]
        if @new_exchange_rate.save

        else
          render json: @new_exchange_rate.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /exchange_rates/1
  def update
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
end
