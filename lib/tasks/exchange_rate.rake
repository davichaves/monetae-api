namespace :exchange_rate do
  desc 'Retrieving the daily exchange rates'
  task retrieve_daily: :environment do
    date = Time.now.strftime("%Y-%m-%d")
    exchange_rate = JSON.parse(RestClient.get "http://data.fixer.io/api/#{date}?access_key=84c960ca7f193d2306f7ac23196f9db9")

    exchange_rate["rates"].each_with_index do |rate, index|
      @new_exchange_rate = ExchangeRate.new
      @new_exchange_rate.base_currency = Currency.find_by(code: exchange_rate["base"])
      @new_exchange_rate.to_currency = Currency.find_by(code: rate[0])
      @new_exchange_rate.from_date = exchange_rate["date"].to_datetime
      @new_exchange_rate.rate = rate[1]
      if @new_exchange_rate.save

      else
        puts "error while saving new daily exchange rates"
        puts @new_exchange_rate.errors.inspect
        break
      end
    end
  end

end
