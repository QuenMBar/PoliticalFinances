class UserSerializer
    include JSONAPI::Serializer
    attributes :id, :username, :bio
end
