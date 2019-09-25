# frozen_string_literal: true

class FetchesController < ApplicationController
  def index
    response = Faraday.get 'http://api.citybik.es/v2/networks/velib'
    @response = JSON.parse response.body, symbolize_names: true
    @response[:network][:stations].each do |station|
      Station.create(
        station_id: station[:id],
        empty_slots: station[:empty_slots],
        free_bikes: station[:free_bikes],
        latitude: station[:latitude],
        longitude: station[:longitude],
        name: station[:name]
      )
    end
  end
end
