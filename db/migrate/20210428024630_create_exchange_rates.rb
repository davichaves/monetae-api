class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.integer :from_currency_id
      t.integer :to_currency_id
      t.decimal :rate
      t.datetime :at

      t.timestamps
    end
  end
end
