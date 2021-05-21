class Committee < ApplicationRecord
    self.primary_key = :comm_id
    has_many :individual_donations
    has_many :politicans
end
