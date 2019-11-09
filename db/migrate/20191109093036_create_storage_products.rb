class CreateStorageProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :storage_products do |t|
      t.integer :num
      t.integer :product_id

      t.timestamps
    end
  end
end
