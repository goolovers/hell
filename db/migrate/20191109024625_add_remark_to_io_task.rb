class AddRemarkToIoTask < ActiveRecord::Migration[6.0]
  def change
    add_column :io_tasks, :remark, :string
  end
end
