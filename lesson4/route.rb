class Route
  # Может выводить список всех станций по-порядку от начальной до конечной
  attr_reader :stations

  # Имеет начальную и конечную станцию, а также список промежуточных станций. 
  # Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(start_point, end_point)
    if start_point.class == RailwayStation && end_point.class == RailwayStation
      @stations = [start_point, end_point]
    else
      puts "ОШИБКА: Хотя бы одна их указанных станций не существует"
    end

  end

  # Может добавлять станцию в список
  def add_station(station)
    if station.class == RailwayStation
      @stations.insert(-2, station)
    else
      puts "Такой станции не существует, сначала задайте станцию"
    end
  end

  # Может удалять станцию из списка
  def del_station(station)
    @stations.delete(station)
  end
  
  # Может выводить список всех станций по-порядку от начальной до конечной
  def get_stations
    print "Список станций: "
    @stations.each do |station|
      print "#{station.name} "
    end
  end
end