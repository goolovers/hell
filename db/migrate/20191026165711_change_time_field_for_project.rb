class ChangeTimeFieldForProject < ActiveRecord::Migration[6.0]
  def change
  	change_column :projects, :plan_start_time, :datetime
  	change_column :projects, :plan_end_time, :datetime
  	change_column :projects, :start_time, :datetime
  	change_column :projects, :end_time, :datetime
  end
end
