class CreateIoTaskDets < ActiveRecord::Migration[6.0]
  def change
    create_table :io_task_dets do |t|
      t.integer :io_task_id
      t.integer :material_id
      t.integer :product_id
      t.integer :num

      t.timestamps
    end
  end
end
