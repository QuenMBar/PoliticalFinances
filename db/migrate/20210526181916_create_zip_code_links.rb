class CreateZipCodeLinks < ActiveRecord::Migration[6.1]
    def change
        create_table :zip_code_links do |t|
            t.belongs_to :user, null: false, foreign_key: true
            t.string :zip_code_id, foreign_key: { to_table: :zip_codes }

            t.timestamps
        end
        add_index :zip_code_links, :zip_code_id
    end
end
