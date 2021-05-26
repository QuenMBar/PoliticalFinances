# require ZipCodeSerializer
class CountySerializer
    include JSONAPI::Serializer
    attributes :name, :state, :total_donated
    has_many :zip_codes
end
