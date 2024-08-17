class CreateLandmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :landmarks do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
