class Book < ApplicationRecord
  has_many :book_rentals
  def available_count
    total_count - rented_count
  end

  def rented_count
    book_rentals.where(returned_at: nil).count
  end

  def income(start_date, end_date)
    book_rentals.where("created_at > ? and returned_at < ?", start_date, end_date).count * price
  end
end
