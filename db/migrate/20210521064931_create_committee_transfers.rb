class CreateCommitteeTransfers < ActiveRecord::Migration[6.1]
    def change
        create_table :committee_transfers do |t|
            t.string :committee_id, foreign_key: { to_table: :committees }
            t.string :amndt_ind
            t.string :rpt_tp
            t.string :transaction_pgi
            t.bigint :image_num
            t.string :transaction_tp
            t.string :entity_tp
            t.string :name
            t.string :city
            t.string :state
            t.string :zip_code
            t.string :employer
            t.string :occupation
            t.bigint :transaction_dt
            t.float :transaction_amt
            t.string :other_id, foreign_key: { to_table: :committees }
            t.string :tran_id
            t.string :file_num
            t.string :memo_cd
            t.string :memo_text
            t.string :sub_id
        end
        add_index :committee_transfers, :committee_id
        add_index :committee_transfers, :other_id
    end
end
