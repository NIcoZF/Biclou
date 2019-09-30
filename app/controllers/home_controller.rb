# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if params[:place] != "" && !params[:place].nil?

      @place = params[:place]
      results = Geocoder.search(@place)
      @latitude = results.first.coordinates[0]
      @longitude = results.first.coordinates[1]
      @stations = Station.all.where("free_bikes != 0").near(results.first.coordinates, 5).take(5)
      respond_to do |format|
        format.html
        format.js
      end
    else

      @stations.nil?
    end
  end
end
