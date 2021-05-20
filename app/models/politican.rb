class Politican < ApplicationRecord
    belongs_to :committee, optional: true
end
