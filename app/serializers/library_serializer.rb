class LibrarySerializer
  include JSONAPI::Serializer
  attributes :name, :description, :location

  has_many :users
  has_many :books
end
