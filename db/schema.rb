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

ActiveRecord::Schema.define(version: 2018_10_21_111115) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "phone_num"
    t.string "email"
    t.integer "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_customers_on_rental_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "imdb_id"
    t.string "imdb_link"
    t.string "title"
    t.decimal "imdb_score"
    t.string "genre"
    t.string "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.datetime "rental_date"
    t.integer "movie_id"
    t.integer "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_rentals_on_movie_id"
    t.index ["storage_id"], name: "index_rentals_on_storage_id"
  end

  create_table "storages", force: :cascade do |t|
    t.decimal "price"
    t.integer "stock_quantity"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_storages_on_movie_id"
  end

end
