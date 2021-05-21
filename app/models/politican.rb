class Politican < ApplicationRecord
    self.primary_key = :cand_id
    belongs_to :committee, optional: true
    has_many :individual_donations, class_name: 'IndividualDonation', foreign_key: 'candidate_id'
end
