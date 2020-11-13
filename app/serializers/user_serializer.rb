class UserSerializer
  include JSONAPI::Serializer
  attributes :account_number, :email, :name, :balance, :book_rentals
end
