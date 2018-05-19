class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)
    @trip.start_time ||= Time.now

    if @trip.save
      redirect_to @trip
    else
      redirect_to root_path, alert: "Whoops, something went wrong"
    end
  end

  def show
    @trip = Trip.find(params[:id])
    resp = JSON.parse(HTTParty.get(@trip.directions_api).body)
    @trip.update_info(resp)

  end


  private

  def trip_params
    params.require(:trip).permit(:start_place, :end_place)
  end
end
