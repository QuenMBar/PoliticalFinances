class AddOrgAndCommToZipAndCommittee < ActiveRecord::Migration[6.1]
    def change
        add_column :zip_codes, :dem_donation_org, :float
        add_column :zip_codes, :rep_donation_org, :float
        add_column :zip_codes, :other_donation_org, :float
        add_column :zip_codes, :total_donated_org, :float

        add_column :counties, :dem_donation_org, :float
        add_column :counties, :rep_donation_org, :float
        add_column :counties, :other_donation_org, :float
        add_column :counties, :total_donated_org, :float

        add_column :zip_codes, :dem_donation_com, :float
        add_column :zip_codes, :rep_donation_com, :float
        add_column :zip_codes, :other_donation_com, :float
        add_column :zip_codes, :total_donated_com, :float

        add_column :counties, :dem_donation_com, :float
        add_column :counties, :rep_donation_com, :float
        add_column :counties, :other_donation_com, :float
        add_column :counties, :total_donated_com, :float
    end
end
