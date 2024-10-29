class CreateGeolocations < ActiveRecord::Migration[7.2]
  def change
    create_table :geolocations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :url
      t.string :ip
      t.references :source, polymorphic: true, null: false

      t.timestamps
    end
  end
end
