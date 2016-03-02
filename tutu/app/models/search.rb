class Search
  include ActiveModel::Validations
  # Required dependency for ActiveModel::Errors
  extend ActiveModel::Naming

  attr_accessor   :end_station_id, :start_station_id
  attr_reader   :errors

  validates :end_station_id, :start_station_id, presence: true
  validate :check_st_uniq

  def initialize (start_station_id, end_station_id)
    @errors = ActiveModel::Errors.new(self)
    @start_station_id = start_station_id
    @end_station_id = end_station_id
  end

  def find
    start_station = RailwayStation.find(@start_station_id)
    end_station = RailwayStation.find(@end_station_id)

    trains_start_st = Train.joins(route: :railway_stations).where("railway_station_id = ?" , start_station)
    trains_end_st =   Train.joins(route: :railway_stations).where("railway_station_id = ? ", end_station)
    return trains_start_st & trains_end_st
  end

private

  def check_st_uniq
    errors.add(:stantions, " не могут быть равны") if @end_station_id == @start_station_id && @start_station_id.presence && @end_station_id.presence
  end

end
