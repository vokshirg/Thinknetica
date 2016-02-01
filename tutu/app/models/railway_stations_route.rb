# Join-table between RailwayStations and Trains

class RailwayStationsRoute < ActiveRecord::Base
  # validates :railway_stations_routes, uniqueness: {
    # scope: [:railway_station, :route],
    # message: "В маршруте не могут повторяться станции"
  # }

  belongs_to :route
  belongs_to :railway_station
end
