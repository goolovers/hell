class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :material_type
      t.string :material_code
      t.string :material_name
      t.string :specs
      t.string :unit
      t.string :brand
      t.integer :num
      t.string :supplier
      t.text :remark

      t.timestamps
    end
  end
end
