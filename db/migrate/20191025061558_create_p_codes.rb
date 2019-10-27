class CreatePCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :p_codes do |t|
      t.string :type_code
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
