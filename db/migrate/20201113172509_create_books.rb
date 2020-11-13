class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.integer :total_count

      t.timestamps
    end
  end
end
