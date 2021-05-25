class ZipCode < ApplicationRecord
    searchkick callbacks: :async
    self.primary_key = :zip
    belongs_to :county, class_name: 'County', foreign_key: 'county_id'
    validates :zip, presence: true, uniqueness: true
end
