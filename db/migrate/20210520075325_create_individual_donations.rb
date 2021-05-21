class CreateIndividualDonations < ActiveRecord::Migration[6.1]
    def change
        create_table :individual_donations do |t|
            t.string :committee_id, foreign_key: { to_table: :committees }
            t.string :amend_ind
            t.string :report_type
            t.string :indicator
            t.string :image
            t.string :trans_type
            t.string :entity_type
            t.string :name
            t.string :city
            t.string :state
            t.string :zip
            t.string :employ
            t.string :occu
            t.integer :date
            t.float :amount
            t.string :candidate_id, foreign_key: { to_table: :politicans }
            t.string :note
            t.bigint :fec_id
            t.string :tran_id
            t.bigint :file_num
            t.string :memo_cd
        end
        add_index :individual_donations, :candidate_id
        add_index :individual_donations, :committee_id
    end
end
