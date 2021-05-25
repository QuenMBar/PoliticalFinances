class IndependentExpenditure < ApplicationRecord
    searchkick
    belongs_to :committee, class_name: 'Committee'
    belongs_to :other, class_name: 'Committee', optional: true
    belongs_to :politican, optional: true

    def other_can_comm
        return false if other_id.nil?
        if other_id.start_with?('C')
            return Committee.find(other_id)
        else
            return Politican.find(other_id)
        end
    end
end
