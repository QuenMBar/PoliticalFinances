class ZipCodeSerializer
    include JSONAPI::Serializer
    attributes :zip, :total_donated
end
