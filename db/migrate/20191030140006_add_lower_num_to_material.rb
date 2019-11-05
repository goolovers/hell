class AddLowerNumToMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :lower_num, :integer
  end
end
