class Customer < ApplicationRecord
    belongs_to :rental

    validates :name,:email, presence: true, uniqueness: true 
end
