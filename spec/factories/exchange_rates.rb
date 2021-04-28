FactoryBot.define do
  factory :exchange_rate do
    from_currency_id { 1 }
    to_currency_id { 1 }
    rate { "9.99" }
    at { "2021-04-27 23:46:30" }
  end
end
