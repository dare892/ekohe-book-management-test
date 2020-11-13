class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :account_number
      t.integer :balance, default: 10
      t.string :password_digest

      t.timestamps
    end
  end
end
