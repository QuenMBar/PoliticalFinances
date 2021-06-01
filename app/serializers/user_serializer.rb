class UserSerializer
    include JSONAPI::Serializer
    attributes :username, :bio, :privacy
    has_many :counties
    has_many :zip_codes
    has_many :individual_donations
end
