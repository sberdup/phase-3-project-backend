# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_09_033219) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "entities", force: :cascade do |t|
    t.integer "category_id"
    t.string "description"
    t.string "image"
    t.string "name"
    t.string "cooking_effect"
    t.integer "hearts_recovered"
    t.integer "attack"
    t.integer "defense"
    t.string "drops"
    t.boolean "logged"
  end

  create_table "entity_locations", force: :cascade do |t|
    t.integer "entity_id"
    t.integer "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

end
