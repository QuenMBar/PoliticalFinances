class CountyLink < ApplicationRecord
    belongs_to :user
    belongs_to :county
    validates_uniqueness_of :county, scope: [:user]
end
