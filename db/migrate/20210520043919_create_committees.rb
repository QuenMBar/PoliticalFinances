class CreateCommittees < ActiveRecord::Migration[6.1]
    def change
        create_table :committees, id: false do |t|
            t.string :comm_id
            t.string :comm_name
            t.string :comm_address
            t.integer :comm_zip
            t.string :comm_des
            t.string :comm_type
            t.string :comm_party
            t.string :comm_cat
            t.string :org_name
            t.float :ttl_receipts
            t.float :trans_from_affiliates
            t.float :trans_from_other_committees
            t.float :indiv_contribute
            t.float :ttl_payments
            t.float :loans
            t.float :repaid_loans
            t.float :trans_to_affiliates
            t.float :indiv_refund
            t.float :committee_refund
            t.float :init_cash
            t.float :end_cash
            t.float :debts
            t.float :trans_nf
            t.float :trans_to_other_committees
            t.float :ind_exp
            t.float :party_exp
            t.float :nf_exp

            t.timestamps
        end
        execute 'ALTER TABLE committees ADD PRIMARY KEY (comm_id);'
    end
end
