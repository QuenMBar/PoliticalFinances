class AddToCountyAndZip < ActiveRecord::Migration[6.1]
    def change
        add_column :zip_codes, :dem_donation, :float
        add_column :zip_codes, :rep_donation, :float
        add_column :zip_codes, :other_donation, :float
        change_column :zip_codes, :total_donated, :float

        add_column :counties, :dem_donation, :float
        add_column :counties, :rep_donation, :float
        add_column :counties, :other_donation, :float
        change_column :counties, :total_donated, :float

        add_column :counties, :log, :float
        add_column :counties, :lat, :float
    end
end
