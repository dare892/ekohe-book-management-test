class BooksController < ApplicationController
  def index
    @books = Book.all
    json_string = BookSerializer.new(@books, {params: {
      start_date: 10.years.ago,
      end_date: DateTime.now}
    }).serializable_hash.to_json
    render json: json_string
  end

  def show
    book = Book.find(params[:id])
    json_string = BookSerializer.new(book, {params: {
      start_date: params[:start_date].to_date,
      end_date: params[:end_date].to_date}
    }).serializable_hash.to_json
    render json: json_string
  end

  def rent
    book = Book.find(params[:id])
    user = User.find(params[:user_id])
    if book.available_count < 1
      render json: {error: 'No more on stock at the moment.'}, status: :unprocessable_entity
    elsif user.balance < book.price
      render json: {error: 'Not enough funds on your balance.'}, status: :unprocessable_entity
    else
      book_rental = BookRental.new(user: user, book: book)
      if book_rental.save
        user.update(balance: user.balance - book.price)
        render json: {message: 'Book Rental was successfully created'}
      else
        render json: {error: book_rental.errors.full_messages.join(',')}, status: :unprocessable_entity
      end
    end
  end
end
