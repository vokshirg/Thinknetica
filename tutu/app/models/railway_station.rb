class RailwayStation < ActiveRecord::Base

  has_many :trains
  has_many :tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def sort_number(route)
    station_route(route).try(:sort_number)
  end

  def arrive_time(route)
    station_route(route).try(:arrive_time)
  end

  def leave_time(route)
    station_route(route).try(:leave_time)
  end

  def change_route_params(route, sort_number, arrive_time, leave_time)
    rsr = station_route(route)
    rsr.update(sort_number: sort_number, arrive_time: arrive_time, leave_time: leave_time) if rsr
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
