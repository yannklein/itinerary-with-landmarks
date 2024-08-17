class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.jsonb :waypoints
      t.string :name

      t.timestamps
    end
  end
end
