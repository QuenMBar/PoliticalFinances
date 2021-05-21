class CreateOperationCosts < ActiveRecord::Migration[6.1]
    def change
        create_table :operation_costs do |t|
            t.string :committee_id, foreign_key: { to_table: :committees }
            t.string :amndt_ind
            t.integer :rpt_yr
            t.string :rpt_tp
            t.bigint :image_num
            t.string :line_num
            t.string :form_tp_cd
            t.string :sched_tp_cd
            t.string :name
            t.string :city
            t.string :state
            t.string :zip_code
            t.string :transaction_dt
            t.float :transaction_amt
            t.string :transaction_pgi
            t.string :purpose
            t.string :category
            t.string :category_desc
            t.string :memo_cd
            t.string :memo_text
            t.string :entity_tp
            t.bigint :sub_id
            t.string :file_num
            t.string :tran_id
            t.string :back_ref_tran_id
            t.string :empty
        end
        add_index :operation_costs, :committee_id
    end
end
