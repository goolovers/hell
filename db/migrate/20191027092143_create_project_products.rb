class CreateProjectProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_products do |t|
      t.integer :project_id
      t.integer :product_id
      t.string :stock_type
      t.integer :need_num
      t.integer :stock_num
      t.integer :project_num

      t.timestamps
    end
  end
end
