class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.string :imdb_link
      t.string :title
      t.decimal :imdb_score
      t.string :genre
      t.string :poster

      t.timestamps
    end
  end
end
