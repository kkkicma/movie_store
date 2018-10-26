class Storage < ApplicationRecord
  belongs_to :movie

  has_many :rental

  validates :price,           presence: true
  validates :stock_quantity,  presence: true, numericality: { only_integer: true }
end
