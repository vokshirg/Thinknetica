# Join-table between RailwayStations and Trains
class RailwayStationsRoute < ActiveRecord::Base

  belongs_to :route
  belongs_to :railway_station

  validates :route, uniqueness: {
    scope: :railway_station,
    message: "В маршруте не могут повторяться станции"
  }

end
