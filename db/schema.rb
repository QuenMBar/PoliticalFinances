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

ActiveRecord::Schema.define(version: 2021_05_21_075944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cand_comm_linkings", force: :cascade do |t|
    t.string "committee_id"
    t.string "politican_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["committee_id"], name: "index_cand_comm_linkings_on_committee_id"
    t.index ["politican_id"], name: "index_cand_comm_linkings_on_politican_id"
  end

  create_table "committee_transfers", force: :cascade do |t|
    t.string "committee_id"
    t.string "amndt_ind"
    t.string "rpt_tp"
    t.string "transaction_pgi"
    t.bigint "image_num"
    t.string "transaction_tp"
    t.string "entity_tp"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "employer"
    t.string "occupation"
    t.bigint "transaction_dt"
    t.float "transaction_amt"
    t.string "other_id"
    t.string "tran_id"
    t.string "file_num"
    t.string "memo_cd"
    t.string "memo_text"
    t.string "sub_id"
    t.index ["committee_id"], name: "index_committee_transfers_on_committee_id"
    t.index ["other_id"], name: "index_committee_transfers_on_other_id"
  end

  create_table "committees", primary_key: "comm_id", id: :string, force: :cascade do |t|
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

  create_table "independent_expenditures", force: :cascade do |t|
    t.string "committee_id"
    t.string "amndt_ind"
    t.string "rpt_tp"
    t.string "transaction_pgi"
    t.bigint "image_num"
    t.string "transaction_tp"
    t.string "entity_tp"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "employer"
    t.string "occupation"
    t.string "transaction_dt"
    t.float "transaction_amt"
    t.string "other_id"
    t.string "politican_id"
    t.string "tran_id"
    t.string "file_num"
    t.string "memo_cd"
    t.string "memo_text"
    t.bigint "sub_id"
    t.index ["committee_id"], name: "index_independent_expenditures_on_committee_id"
    t.index ["other_id"], name: "index_independent_expenditures_on_other_id"
    t.index ["politican_id"], name: "index_independent_expenditures_on_politican_id"
  end

  create_table "individual_donations", force: :cascade do |t|
    t.string "committee_id"
    t.string "amend_ind"
    t.string "report_type"
    t.string "indicator"
    t.string "image"
    t.string "trans_type"
    t.string "entity_type"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "employ"
    t.string "occu"
    t.integer "date"
    t.float "amount"
    t.string "candidate_id"
    t.string "note"
    t.bigint "fec_id"
    t.string "tran_id"
    t.bigint "file_num"
    t.string "memo_cd"
    t.index ["candidate_id"], name: "index_individual_donations_on_candidate_id"
    t.index ["committee_id"], name: "index_individual_donations_on_committee_id"
  end

  create_table "operation_costs", force: :cascade do |t|
    t.string "committee_id"
    t.string "amndt_ind"
    t.integer "rpt_yr"
    t.string "rpt_tp"
    t.bigint "image_num"
    t.string "line_num"
    t.string "form_tp_cd"
    t.string "sched_tp_cd"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "transaction_dt"
    t.float "transaction_amt"
    t.string "transaction_pgi"
    t.string "purpose"
    t.string "category"
    t.string "category_desc"
    t.string "memo_cd"
    t.string "memo_text"
    t.string "entity_tp"
    t.bigint "sub_id"
    t.string "file_num"
    t.string "tran_id"
    t.string "back_ref_tran_id"
    t.string "empty"
    t.index ["committee_id"], name: "index_operation_costs_on_committee_id"
  end

  create_table "politicans", primary_key: "cand_id", id: :string, force: :cascade do |t|
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
    t.string "committee_id"
    t.string "camp_address"
    t.integer "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["committee_id"], name: "index_politicans_on_committee_id"
  end

end
