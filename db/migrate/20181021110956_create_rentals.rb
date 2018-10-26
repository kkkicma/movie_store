class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.datetime :rental_date
      t.references :movie, foreign_key: true
      t.references :storage, foreign_key: true

      t.timestamps
    end
  end
end
