class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_code
      t.string :user_name
      t.string :password
      t.integer :user_type

      t.timestamps
    end
  end
end
