class Politican < ApplicationRecord
    self.primary_key = :cand_id
    belongs_to :my_committee, class_name: 'Committee', foreign_key: 'committee_id', optional: true
    has_many :individual_donations, class_name: 'IndividualDonation', foreign_key: 'candidate_id'
    has_many :cand_comm_linkings
    has_many :all_committees, through: :cand_comm_linkings, source: :committee
end
