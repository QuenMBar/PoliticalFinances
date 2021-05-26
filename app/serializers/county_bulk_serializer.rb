class CountyBulkSerializer
    include JSONAPI::Serializer
    attributes :name, :state, :total_donated
end
