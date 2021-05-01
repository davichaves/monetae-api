class ExchangeRate < ApplicationRecord
  belongs_to :base_currency, class_name: "Currency", foreign_key: :base_currency_id
  belongs_to :to_currency, class_name: "Currency", foreign_key: :to_currency_id

  validates :from_date, uniqueness: { scope: :to_currency,
    message: "should have only one rate per day" }
end
