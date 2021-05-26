class IndividualDonation < ApplicationRecord
    searchkick callbacks: :async
    scope :search_import, -> { includes(:committee) }
    belongs_to :committee, class_name: 'Committee'
    belongs_to :candidate, class_name: 'Politican', optional: true

    has_many :individual_donation_links
    has_many :users, through: :individual_donation_links

    def search_data
        {
            name: name,
            city: city,
            state: state,
            zip: zip,
            committee_id: committee_id,
            committee: committee.comm_name,
            employ: employ,
            occu: occu,
            date: date,
            amount: amount,
            candidate_id: candidate_id,
            entity_type: entity_type,
            trans_type: trans_type,
        }
    end

    def other_can_comm
        return false if candidate_id.nil?
        if candidate_id.start_with?('C')
            return Committee.find(candidate_id)
        else
            return Politican.find(candidate_id)
        end
    end
end
