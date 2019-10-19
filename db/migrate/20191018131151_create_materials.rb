class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :material_type
      t.string :material_code
      t.string :material_name
      t.string :specs
      t.string :unit
      t.string :brand
      t.integer :num
      t.string :supplier
      t.integer :tax_rate
      t.float :before_tax
      t.float :after_tax
      t.text :remark

      t.timestamps
    end
  end
end
