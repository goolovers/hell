class AddLowerNumToStorageMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :storage_materials, :lower_num, :integer
  end
end
