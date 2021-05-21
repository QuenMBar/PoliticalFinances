class IndividualDonation < ApplicationRecord
    belongs_to :committee, class_name: 'Committee'
    belongs_to :candidate, class_name: 'Politican', optional: true

    def other_can_comm
        return false if candidate_id.nil?
        if candidate_id.start_with?('C')
            return Committee.find(candidate_id)
        else
            return Politican.find(candidate_id)
        end
    end
end
