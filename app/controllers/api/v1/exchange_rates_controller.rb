class Api::V1::ExchangeRatesController < ApplicationController
  def index
  end

  def show
  end

  def create
    # start_date = Date.parse('2020-03-01')
    # end_date = Date.parse('2013-04-28')
    #
    # (start_date..end_date).each do |day|
    #   puts day
    # end

    path = Rails.root.join('app', 'assets','exchange_rate.json')

    exchange_rate = JSON.parse(File.read(path))

    @base_currency = Currency.find_by(symbol: exchange_rate["base"])

    puts @base_currency

    # response = JSON.parse(RestClient.get "http://data.fixer.io/api/2020-04-28?access_key=84c960ca7f193d2306f7ac23196f9db9")
    # @exchange_rate = ExchangeRate.new(exchange_rate_params)
    #
    # if @exchange_rate.save
    #   render json: @exchange_rate, status: :created, location: @exchange_rate
    # else
    #   render json: @exchange_rate.errors, status: :unprocessable_entity
    # end
  end

  def update
  end

  def destroy
  end
end
