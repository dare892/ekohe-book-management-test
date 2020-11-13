class CreateBookRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :book_rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :returned_at

      t.timestamps
    end
  end
end
