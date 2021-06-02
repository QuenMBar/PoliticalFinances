# require ZipCodeSerializer
class CountySerializer
    include JSONAPI::Serializer
    attributes :name, :state, :total_donated, :dem_donation, :rep_donation, :other_donation
    has_many :zip_codes
end
