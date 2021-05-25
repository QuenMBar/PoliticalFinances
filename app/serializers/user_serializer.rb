class UserSerializer
    include JSONAPI::Serializer
    attributes :username, :bio
end
