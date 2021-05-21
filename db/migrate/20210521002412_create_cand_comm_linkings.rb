class CreateCandCommLinkings < ActiveRecord::Migration[6.1]
    def change
        create_table :cand_comm_linkings do |t|
            t.string :committee_id, foreign_key: { to_table: :committees }
            t.string :politican_id, foreign_key: { to_table: :politicans }

            t.timestamps
        end
        add_index :cand_comm_linkings, :committee_id
        add_index :cand_comm_linkings, :politican_id
    end
end
