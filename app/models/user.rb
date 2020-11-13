class User < ApplicationRecord
  has_secure_password
  has_many :book_rentals
  before_create :initialize_random_account_num
  validates_uniqueness_of :email

  def initialize_random_account_num
    generated_hex = rand(100000..999999)
    while(User.find_by(account_number: generated_hex))
      generated_hex = rand(100000..999999)
    end
    self.account_number = generated_hex
  end
end
