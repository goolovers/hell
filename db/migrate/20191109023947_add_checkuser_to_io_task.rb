class AddCheckuserToIoTask < ActiveRecord::Migration[6.0]
  def change
    add_column :io_tasks, :check_user_id, :integer
  end
end
