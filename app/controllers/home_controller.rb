class HomeController < ApplicationController
  def root
    @trip = Trip.new
  end
end
