class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.references :base_currency, foreign_key: { to_table: :currencies }
      t.references :to_currency, foreign_key: { to_table: :currencies }
      t.decimal :rate
      t.datetime :from_date

      t.timestamps
    end
  end
end
