# Join-table between RailwayStations and Trains

class RailwayStationsRoute < ActiveRecord::Base
  validates :route, uniqueness: {
    scope: :railway_station,
    message: "В маршруте не могут повторяться станции"
  }

  belongs_to :route
  belongs_to :railway_station
end
