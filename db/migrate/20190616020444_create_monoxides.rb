class CreateMonoxides < ActiveRecord::Migration[6.0]
  def change
    create_table :monoxides do |t|
      t.integer :serial_number
      t.integer :value
      t.timestamp :time

      t.timestamps
    end
  end
end
