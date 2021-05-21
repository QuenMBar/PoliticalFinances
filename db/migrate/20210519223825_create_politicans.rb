class CreatePoliticans < ActiveRecord::Migration[6.1]
    def change
        create_table :politicans, id: false do |t|
            t.string :cand_id
            t.string :cand_name
            t.string :cand_party
            t.float :ttl_receipts
            t.float :trans_from_committees
            t.float :ttl_payments
            t.float :trans_to_committees
            t.float :init_cash
            t.float :end_cash
            t.float :cand_contribute
            t.float :loans
            t.float :repaid_loans
            t.float :debts
            t.float :indiv_contribute
            t.string :cand_state
            t.string :cand_dist
            t.float :other_committee_con
            t.float :party_committee_con
            t.float :indiv_refund
            t.float :committee_refund
            t.integer :elec_year
            t.string :cand_office
            t.string :cand_status
            t.string :committee_id, foreign_key: { to_table: :committees }
            t.string :camp_address
            t.integer :zip

            t.timestamps
        end
        add_index :politicans, :committee_id
        execute 'ALTER TABLE politicans ADD PRIMARY KEY (cand_id);'
    end
end
