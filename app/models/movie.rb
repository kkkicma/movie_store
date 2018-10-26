class Movie < ApplicationRecord
    has_many :storage, dependent: :destroy
    has_many :rental
    
    validates :imdb_id,                                presence: true, uniqueness: true
    validates :imdb_link, :title, :imdb_score, :genre, presence: true
end
