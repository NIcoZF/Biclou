# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    results = Geocoder.search("Paris")
    @stations = Station.all.where("free_bikes != 0").near(results.first.coordinates, 5).take(5)
  end
end
