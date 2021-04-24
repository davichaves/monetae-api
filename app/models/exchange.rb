class Exchange < ApplicationRecord
  belongs_to :from_currency
  belongs_to :to_currency
end
