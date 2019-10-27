class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.datetime :plan_start_time
      t.datetime :plan_end_time
      t.datetime :start_time
      t.datetime :end_time
      t.string :charge

      t.timestamps
    end
  end
end
