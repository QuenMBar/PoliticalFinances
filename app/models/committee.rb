class Committee < ApplicationRecord
    searchkick
    self.primary_key = :comm_id
    has_many :individual_donations
    has_many :politicans
    has_many :cand_comm_linkings
    has_many :committee_transfers, class_name: 'CommitteeTransfer', foreign_key: 'committee_id'
    has_many :committee_sent_transfers, class_name: 'CommitteeTransfer', foreign_key: 'other_id'
    has_many :operation_costs
    has_many :independent_expenditures, class_name: 'IndependentExpenditure', foreign_key: 'committee_id'
    has_many :independent_other_expenditures, class_name: 'IndependentExpenditure', foreign_key: 'other_id'
end
