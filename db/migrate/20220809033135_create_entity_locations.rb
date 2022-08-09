class CreateEntityLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :entity_locations do |t|
      t.integer :entity_id
      t.integer :location_id
    end
  end
end
