class IndividualDonationSerializer
    include JSONAPI::Serializer
    attributes :name, :amount, :city, :state, :zip, :employ, :occu, :date, :note, :entity_type
    belongs_to :committee
    # set_key_transform :camel
end
