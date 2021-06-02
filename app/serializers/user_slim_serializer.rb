class UserSlimSerializer
    include JSONAPI::Serializer
    has_many :counties
    has_many :zip_codes
    has_many :individual_donations
end
