# require ZipCodeSerializer
class CountySerializer
    include JSONAPI::Serializer
    attributes :name,
               :state,
               :total_donated,
               :dem_donation,
               :rep_donation,
               :other_donation,
               :total_donated_org,
               :dem_donation_org,
               :rep_donation_org,
               :other_donation_org,
               :total_donated_com,
               :dem_donation_com,
               :rep_donation_com,
               :other_donation_com
    has_many :zip_codes
end
