class Trip < ApplicationRecord
  validates_presence_of :start_place

  def directions_api
    base_api = "https://maps.googleapis.com/maps/api/directions/json?"
    keys = []
    keys << "key=#{ENV['google_key']}"
    keys << "origin=#{url_friendly(start_place)}" if start_place
    keys << "destination=#{url_friendly(end_place)}" if end_place
    base_api + keys.join("&")
  end

  def url_friendly(string)
    string.gsub(",", "").split(" ").join("+")
  end

  def update_info(geo_data)
    update({
      start_lat: geo_data['routes'][0]['legs'][0]['start_location']['lat'],
      start_long: geo_data['routes'][0]['legs'][0]['start_location']['lng'],
      end_lat: geo_data['routes'][0]['legs'][0]['end_location']['lat'],
      end_long: geo_data['routes'][0]['legs'][0]['end_location']['lng'],
      start_time: Time.now
    })
  end
end
