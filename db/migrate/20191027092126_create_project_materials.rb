class CreateProjectMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :project_materials do |t|
      t.integer :project_id
      t.integer :material_id
      t.string :stock_type
      t.integer :need_num
      t.integer :stock_num
      t.integer :project_num

      t.timestamps
    end
  end
end
