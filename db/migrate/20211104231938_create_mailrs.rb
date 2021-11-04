class CreateMailrs < ActiveRecord::Migration[5.1]
  def change
    create_table :mailrs do |t|
      t.string :remind_str
      t.string :dest_address
      t.datetime :sending_at
      t.boolean :is_sent

      t.timestamps
    end
  end
end
