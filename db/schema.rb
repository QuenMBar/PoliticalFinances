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

ActiveRecord::Schema.define(version: 2021_05_20_043919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "committees", force: :cascade do |t|
    t.string "comm_id"
    t.string "comm_name"
    t.string "comm_address"
    t.integer "comm_zip"
    t.string "comm_des"
    t.string "comm_type"
    t.string "comm_party"
    t.string "comm_cat"
    t.string "org_name"
    t.float "ttl_receipts"
    t.float "trans_from_affiliates"
    t.float "trans_from_other_committees"
    t.float "indiv_contribute"
    t.float "ttl_payments"
    t.float "loans"
    t.float "repaid_loans"
    t.float "trans_to_affiliates"
    t.float "indiv_refund"
    t.float "committee_refund"
    t.float "init_cash"
    t.float "end_cash"
    t.float "debts"
    t.float "trans_nf"
    t.float "trans_to_other_committees"
    t.float "ind_exp"
    t.float "party_exp"
    t.float "nf_exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "politicans", force: :cascade do |t|
    t.string "cand_id"
    t.string "cand_name"
    t.string "cand_party"
    t.float "ttl_receipts"
    t.float "trans_from_committees"
    t.float "ttl_payments"
    t.float "trans_to_committees"
    t.float "init_cash"
    t.float "end_cash"
    t.float "cand_contribute"
    t.float "loans"
    t.float "repaid_loans"
    t.float "debts"
    t.float "indiv_contribute"
    t.string "cand_state"
    t.string "cand_dist"
    t.float "other_committee_con"
    t.float "party_committee_con"
    t.float "indiv_refund"
    t.float "committee_refund"
    t.integer "elec_year"
    t.string "cand_office"
    t.string "cand_status"
    t.bigint "committee_id"
    t.string "camp_address"
    t.integer "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["committee_id"], name: "index_politicans_on_committee_id"
  end

end
