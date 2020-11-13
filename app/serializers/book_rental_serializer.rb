class BookRentalSerializer
  include JSONAPI::Serializer
  attributes :returned_at
end
