class User < ApplicationRecord
    searchkick
    has_secure_password

    has_many :individual_donation_links, dependent: :destroy
    has_many :individual_donations, through: :individual_donation_links

    has_many :zip_code_links, dependent: :destroy
    has_many :zip_codes, through: :zip_code_links

    has_many :county_links, dependent: :destroy
    has_many :counties, through: :county_links

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true
end
