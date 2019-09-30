# frozen_string_literal: true

class UpdateStationsJob < ApplicationJob
  queue_as :default

  def perform
    response = Faraday.get 'http://api.citybik.es/v2/networks/velib'
    @response = JSON.parse response.body, symbolize_names: true
    @response[:network][:stations].each do |station|
      velibstation = Velibstation.find_by(station_id: station[:id])
      next unless velibstation.free_bikes != station[:free_bikes]

      velibstation.update(
        empty_slots: station[:empty_slots],
        free_bikes: station[:free_bikes],
      )
    end
  end
end
