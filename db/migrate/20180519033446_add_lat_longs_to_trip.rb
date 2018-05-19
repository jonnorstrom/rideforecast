class AddLatLongsToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :start_lat, :string
    add_column :trips, :start_long, :string
    add_column :trips, :end_lat, :string
    add_column :trips, :end_long, :string
  end
end
