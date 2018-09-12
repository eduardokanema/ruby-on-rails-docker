# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_12_145934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "addresses", id: false, force: :cascade do |t|
    t.float "lon"
    t.float "lat"
    t.string "number"
    t.string "street"
    t.string "unit"
    t.string "city"
    t.string "district"
    t.string "region"
    t.string "postcode"
    t.string "id"
    t.string "hash"
    t.index ["city"], name: "addresses_city_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["number"], name: "addresses_number_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["postcode"], name: "addresses_postcode_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["region"], name: "addresses_region_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["street"], name: "addresses_idx_street", opclass: :gin_trgm_ops, using: :gin
    t.index ["street"], name: "addresses_street_idx", using: :gin
    t.index ["unit"], name: "addresses_unit_idx", using: :gin
  end


  create_view "addresses_mviews", materialized: true,  sql_definition: <<-SQL
      SELECT addresses.id,
      concat(addresses.unit, ' ', addresses.number, ' ', addresses.street, ', ', addresses.city, ' ', addresses.region, ' ', addresses.postcode) AS address
     FROM addresses;
  SQL

  add_index "addresses_mviews", ["address"], name: "addresses_mviews_idx", opclass: :gin_trgm_ops, using: :gin

end
