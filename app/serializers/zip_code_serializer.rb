class ZipCodeSerializer
    include JSONAPI::Serializer
    attributes :zip, :total_donated, :dem_donation, :rep_donation, :other_donation
    belongs_to :county
end
