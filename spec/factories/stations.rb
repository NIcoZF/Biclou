FactoryBot.define do
  factory :station do
    station_id { "MyString" }
    empty_slots { 1 }
    free_bikes { 1 }
    name { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
