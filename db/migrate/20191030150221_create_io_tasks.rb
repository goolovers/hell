class CreateIoTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :io_tasks do |t|
      t.string :io_type
      t.string :io_reason
      t.timestamp :io_at
      t.integer :apply_user_id
      t.integer :exec_user_id
      t.string :status
      t.string :material_product_type
      t.string :io_wh
      t.integer :project_id

      t.timestamps
    end
  end
end
