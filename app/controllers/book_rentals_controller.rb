class BookRentalsController < ApplicationController
  def mine
    user = User.find(params[:user_id])
    rentals = user.book_rentals
    json_string = BookRentalSerializer.new(rentals).serializable_hash.to_json
    render json: json_string
  end

  def return_book
    book_rental = BookRental.find(params[:id])
    if book_rental.returned_at.present?
      render json: {error: 'You have already returned this book.'}, status: :unprocessable_entity
    elsif book_rental.update(returned_at: DateTime.now)
      render json: {message: 'Book was successfully returned'}
    else
      render json: {error: book_rental.errors.full_messages.join(',')}, status: :unprocessable_entity
    end
  end
end
