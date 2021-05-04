class Api::V1::ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :update, :destroy]

  # GET /exchange_rates/base/:base/to/:to
  def get_rates
    @euro_currency = Currency.find_by(code: "EUR")
    @base_currency = Currency.find_by(code: params[:base])
    @to_currency = Currency.find_by(code: params[:to])

    @base_exchange_rates = ExchangeRate.select("rate, from_date").where(
      base_currency_id: @euro_currency.id,
      to_currency_id: @base_currency.id,
    ).order(:from_date)

    @to_exchange_rates = ExchangeRate.select("rate, from_date").where(
      base_currency_id: @euro_currency.id,
      to_currency_id: @to_currency.id,
    ).order(:from_date)

    @exchange_rates = []

    if @base_exchange_rates.size == @to_exchange_rates.size
      @base_exchange_rates.zip(@to_exchange_rates).each do |base, to|
        @exchange_rates << {
          "rate": (to.rate/base.rate).round(2),
          "from_date": base.from_date
        }
      end
    end

    render json: @exchange_rates
  end

  # GET /exchange_rates/base/:base/to/:to/at/:date
  def get_rate_for_date
    @euro_currency = Currency.find_by(code: "EUR")
    @base_currency = Currency.find_by(code: params[:base])
    @to_currency = Currency.find_by(code: params[:to])

    @base_exchange_rate = ExchangeRate.select("rate, from_date").find_by(
      base_currency_id: @euro_currency.id,
      to_currency_id: @base_currency.id,
      from_date: params[:date].to_datetime
    )

    @to_exchange_rate = ExchangeRate.select("rate, from_date").find_by(
      base_currency_id: @euro_currency.id,
      to_currency_id: @to_currency.id,
      from_date: params[:date].to_datetime
    )

    rate = @to_exchange_rate.rate/@base_exchange_rate.rate

    @exchange_rate = {
      "rate": rate.round(2),
      "from_date": @to_exchange_rate.from_date
    }

    render json: @exchange_rate
  end

  # GET /exchange_rates/base/:base/to/:to/from_date/:from_date/to_date/:to_date
  def get_rate_for_date_range
    @euro_currency = Currency.find_by(code: "EUR")
    @base_currency = Currency.find_by(code: params[:base])
    @to_currency = Currency.find_by(code: params[:to])

    @base_exchange_rates = ExchangeRate.select("rate, from_date").where(
      base_currency_id: @euro_currency.id,
      to_currency_id: @base_currency.id,
      from_date: params[:from_date].to_datetime..params[:to_date].to_datetime,
    ).order(:from_date)

    @to_exchange_rates = ExchangeRate.select("rate, from_date").where(
      base_currency_id: @euro_currency.id,
      to_currency_id: @to_currency.id,
      from_date: params[:from_date].to_datetime..params[:to_date].to_datetime,
    ).order(:from_date)

    @exchange_rates = []

    if @base_exchange_rates.size == @to_exchange_rates.size
      @base_exchange_rates.zip(@to_exchange_rates).each do |base, to|
        @exchange_rates << {
          "rate": (to.rate/base.rate).round(2),
          "from_date": base.from_date
        }
      end
    end

    render json: @exchange_rates
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
