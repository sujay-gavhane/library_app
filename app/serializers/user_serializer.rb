class UserSerializer
  include JSONAPI::Serializer
  attributes :full_name, :email

  has_many :libraries
  has_many :books
end
