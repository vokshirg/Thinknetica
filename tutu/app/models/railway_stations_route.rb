# Join-table between RailwayStations and Trains
class RailwayStationsRoute < ActiveRecord::Base

  belongs_to :route
  belongs_to :railway_station

  default_scope { order(:sort_number) }

  validates :route_id, uniqueness: {
    scope: :railway_station_id,
    message: "В маршруте не могут повторяться станции"
  }

end
