class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :storage

  has_many :customer, dependent: :destroy

  validates :rental_date, presence: true
end
