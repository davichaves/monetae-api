class Currency < ApplicationRecord
  has_many :base_exchange_rates, class_name: "ExchangeRate", foreign_key: :base_currency_id
  has_many :to_exchange_rates, class_name: "ExchangeRate", foreign_key: :to_currency_id
end
