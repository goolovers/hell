class CreateStorageMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :storage_materials do |t|
      t.integer :num
      t.integer :material_id

      t.timestamps
    end
  end
end
