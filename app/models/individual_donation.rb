class IndividualDonation < ApplicationRecord
    belongs_to :committee, class_name: 'Committee'
    belongs_to :candidate, class_name: 'Politican', optional: true

    def other_can_comm
        return false if candidate_id.nil?
        p candidate_id.start_with?('C')
        if candidate_id.start_with?('C')
            p 1
            return Committee.find(candidate_id)
        else
            p 2
            return Politican.find(candidate_id)
        end
    end
end
