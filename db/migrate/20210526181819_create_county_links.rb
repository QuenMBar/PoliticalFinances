class CreateCountyLinks < ActiveRecord::Migration[6.1]
    def change
        create_table :county_links do |t|
            t.belongs_to :user, null: false, foreign_key: true
            t.string :county_id, foreign_key: { to_table: :counties }

            t.timestamps
        end
        add_index :county_links, :county_id
    end
end
