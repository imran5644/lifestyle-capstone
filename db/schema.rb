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

ActiveRecord::Schema.define(version: 20_210_305_215_228) do
  create_table 'article_categories', force: :cascade do |t|
    t.integer 'article_id', null: false
    t.integer 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_article_categories_on_article_id'
    t.index ['category_id'], name: 'index_article_categories_on_category_id'
  end

  create_table 'articles', force: :cascade do |t|
    t.integer 'author_id'
    t.text 'image'
    t.string 'title'
    t.text 'text'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.integer 'priority'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'votes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'article_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_votes_on_article_id'
    t.index %w[user_id article_id], name: 'index_votes_on_user_id_and_article_id', unique: true
    t.index ['user_id'], name: 'index_votes_on_user_id'
  end

  add_foreign_key 'article_categories', 'articles'
  add_foreign_key 'article_categories', 'categories'
  add_foreign_key 'votes', 'articles'
  add_foreign_key 'votes', 'users'
end
