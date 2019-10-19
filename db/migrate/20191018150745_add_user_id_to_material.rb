class AddUserIdToMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :user_id, :integer
  end
end
