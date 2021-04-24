FactoryBot.define do
  factory :exchange do
    from_currency { nil }
    to_currency { nil }
    rate { "9.99" }
  end
end
