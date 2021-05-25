class CreateZipCodes < ActiveRecord::Migration[6.1]
    def change
        create_table :zip_codes, id: false do |t|
            t.string :zip
            t.string :county_id, foreign_key: { to_table: :counties }
            t.integer :total_donated

            t.timestamps
        end
        add_index :zip_codes, :county_id
        execute 'ALTER TABLE zip_codes ADD PRIMARY KEY (zip);'
    end
end
