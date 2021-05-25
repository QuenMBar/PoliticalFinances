class County < ApplicationRecord
    searchkick callbacks: :async
    self.primary_key = :fids
    has_many :zip_codes, class_name: 'ZipCode', foreign_key: 'county_id'
    validates :fids, presence: true, uniqueness: true
end
