class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.references :from_currency, null: false, foreign_key: true
      t.references :to_currency, null: false, foreign_key: true
      t.decimal :rate, precision: 5

      t.timestamps
    end
  end
end
