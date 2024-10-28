class CreateGpsDevices < ActiveRecord::Migration[7.2]
  def change
    create_table :gps_devices do |t|
      t.string :serial_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
