class Route
  include Validator
  attr_reader :stations

  def initialize(start_point, end_point)
      @stations = [start_point, end_point]
      validate!
  end

  def add_station(station)
    if station.class == RailwayStation
      @stations.insert(-2, station)
    else
      raise "Такой станции не существует, сначала задайте станцию"
    end
  end

  def del_station(station)
    @stations.delete(station)
  end
  
  def get_stations
    print "Список станций: "
    @stations.each do |station|
      print "#{station.name} "
    end
  end
end