class RailwayStation < ActiveRecord::Base

  has_many :trains
  has_many :tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def sort_number(rt)
    self.railway_stations_routes.where(route: rt).first.sort_number
  end

end
