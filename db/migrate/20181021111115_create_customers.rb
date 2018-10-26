class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.integer :phone_num
      t.string :email
      t.references :rental

      t.timestamps
    end
  end
end
