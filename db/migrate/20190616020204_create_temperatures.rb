class CreateTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|
      t.integer :serial_number
      t.float :value
      t.timestamp :time

      t.timestamps
    end
  end
end
