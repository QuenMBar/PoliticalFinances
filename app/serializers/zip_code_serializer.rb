class ZipCodeSerializer
    include JSONAPI::Serializer
    attributes :zip,
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
    belongs_to :county
end
