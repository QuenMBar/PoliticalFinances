class CreateIndividualDonationLinks < ActiveRecord::Migration[6.1]
    def change
        create_table :individual_donation_links do |t|
            t.belongs_to :user, null: false, foreign_key: true
            t.belongs_to :individual_donation, null: false, foreign_key: true

            t.timestamps
        end
    end
end
