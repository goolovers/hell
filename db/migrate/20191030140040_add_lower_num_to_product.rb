class AddLowerNumToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :lower_num, :integer
  end
end
