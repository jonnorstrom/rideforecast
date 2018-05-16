class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :start_place, null: false
      t.string :end_place
      t.datetime :start_time

      t.timestamps
    end
  end
end
