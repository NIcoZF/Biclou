# frozen_string_literal: true

class Station < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
end
