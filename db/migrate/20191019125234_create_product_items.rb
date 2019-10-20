class CreateProductItems < ActiveRecord::Migration[6.0]
  def change
    create_table :product_items do |t|
      t.integer :num
      t.integer :product_id
      t.integer :material_id

      t.timestamps
    end
  end
end
