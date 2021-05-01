# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_30_074729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.string "code"
    t.string "country"
    t.string "flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "base_currency_id"
    t.bigint "to_currency_id"
    t.decimal "rate"
    t.datetime "from_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["base_currency_id"], name: "index_exchange_rates_on_base_currency_id"
    t.index ["to_currency_id"], name: "index_exchange_rates_on_to_currency_id"
  end

  add_foreign_key "exchange_rates", "currencies", column: "base_currency_id"
  add_foreign_key "exchange_rates", "currencies", column: "to_currency_id"
end
