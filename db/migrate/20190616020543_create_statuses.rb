class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :serial_number
      t.integer :value
      t.timestamp :time

      t.timestamps
    end
  end
end
