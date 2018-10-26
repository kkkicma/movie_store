class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.decimal :price
      t.integer :stock_quantity
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
