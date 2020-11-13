class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :total_count, :rented_count, :available_count

  attributes :income do |book, params|
    book.income(params[:start_date], params[:end_date])
  end
end
