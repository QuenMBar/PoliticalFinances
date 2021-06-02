class CommitteeSerializer
    include JSONAPI::Serializer
    attributes :comm_name, :comm_party
end
