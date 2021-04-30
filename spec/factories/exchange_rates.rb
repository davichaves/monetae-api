FactoryBot.define do
  factory :exchange_rate do
    from_currency_id { 1 }
    to_currency_id { 1 }
    rate { "9.99" }
    from_date { "2021-04-30 04:47:29" }
  end
end
