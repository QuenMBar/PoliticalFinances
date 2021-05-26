class UserSerializer
    include JSONAPI::Serializer
    attributes :username, :bio
    has_many :counties
end
