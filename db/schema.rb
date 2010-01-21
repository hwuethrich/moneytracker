# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090226143324) do

  create_table "expenses", :force => true do |t|
    t.float    "amount"
    t.string   "description"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recurrent_expense_id"
  end

  add_index "expenses", ["date"], :name => "index_expenses_on_date"
  add_index "expenses", ["recurrent_expense_id"], :name => "index_expenses_on_recurrent_expense_id"
  add_index "expenses", ["user_id"], :name => "index_expenses_on_user_id"

  create_table "payments", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.float    "amount"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recurrent_payment_id"
  end

  add_index "payments", ["date"], :name => "index_payments_on_date"
  add_index "payments", ["recipient_id"], :name => "index_payments_on_recipient_id"
  add_index "payments", ["recurrent_payment_id"], :name => "index_payments_on_recurrent_payment_id"
  add_index "payments", ["sender_id"], :name => "index_payments_on_sender_id"

  create_table "recurrent_expenses", :force => true do |t|
    t.float    "amount"
    t.string   "description"
    t.string   "months"
    t.integer  "day"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recurrent_expenses", ["user_id"], :name => "index_recurrent_expenses_on_user_id"

  create_table "recurrent_payments", :force => true do |t|
    t.float    "amount"
    t.string   "comment"
    t.string   "months"
    t.integer  "day"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recurrent_payments", ["recipient_id"], :name => "index_recurrent_payments_on_recipient_id"
  add_index "recurrent_payments", ["sender_id"], :name => "index_recurrent_payments_on_sender_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "firstname",                 :limit => 100, :default => ""
    t.string   "lastname",                  :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                    :default => false
    t.string   "bank_account_no"
    t.string   "language"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
