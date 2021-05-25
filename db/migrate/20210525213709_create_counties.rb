class CreateCounties < ActiveRecord::Migration[6.1]
    def change
        create_table :counties, id: false do |t|
            t.string :fids
            t.string :name
            t.string :state
            t.integer :total_donated

            t.timestamps
        end
        execute 'ALTER TABLE counties ADD PRIMARY KEY (fids);'
    end
end
