class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.string :code
      t.string :country
      t.string :flag

      t.timestamps
    end
  end
end
