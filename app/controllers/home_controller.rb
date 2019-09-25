class HomeController < ApplicationController

  def index

    results = Geocoder.search("place de la république")
    @stations = Station.all.where("free_bikes != 0").near(results.first.coordinates, 3).take(5)
   
  end
end