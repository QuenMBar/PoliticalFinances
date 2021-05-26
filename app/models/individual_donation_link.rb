class IndividualDonationLink < ApplicationRecord
  belongs_to :user
  belongs_to :individual_donation
end
