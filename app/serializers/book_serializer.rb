class BookSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :status

  has_one :library
  has_one :user
end
