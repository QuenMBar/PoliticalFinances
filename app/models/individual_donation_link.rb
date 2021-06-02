class IndividualDonationLink < ApplicationRecord
    belongs_to :user
    belongs_to :individual_donation
    validates_uniqueness_of :individual_donation, scope: [:user]
end
