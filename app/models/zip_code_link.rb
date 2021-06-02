class ZipCodeLink < ApplicationRecord
    belongs_to :user
    belongs_to :zip_code
    validates_uniqueness_of :zip_code, scope: [:user]
end
