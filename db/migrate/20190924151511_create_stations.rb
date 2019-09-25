# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :station_id
      t.integer :empty_slots
      t.integer :free_bikes
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
