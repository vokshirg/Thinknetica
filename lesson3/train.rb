class Train
  attr_reader :type, :wagons, :speed
  
  def initialize (type, wagons)
    @type = type
    @wagons = wagons.to_i
    @speed = 0
  end

  def start
    @speed = 50
  end 

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    if @speed == 0
      puts "Поезд и так уже стоит"
    elsif @speed >= speed
      @speed -= speed
    elsif @speed < speed
      self.stop
    end
  end

  def stop
    @speed = 0
  end

  def add_wagon
    if @speed == 0 
      @wagons += 1
    else
      puts "Поезд движется, прицеплять вагоны нельзя"
    end
  end
  def del_wagon
    if @speed == 0 
      if @wagons != 0
        @wagons -= 1
      else
        puts "У поезда и так нет вагонов"
      end
    else
      puts "Поезд движется, отцеплять вагоны нельзя"
    end
  end

  def set_route(route)
    if route.class == Route
      @route = route
      @current_station = route.stations[0]
    else
      puts "Данного маршрута не существует"
    end
  end

  def move_to_station(station)
    @current_station = station
  end

  def next_station
    @next_station = @route[@route.index(@current_station) + 1]
    puts @next_station.name
  end
  def current_station
    puts @current_station.name
  end
  def back_station
    @back_station = @route[@route.index(@current_station) - 1]
    puts @back_station.name
  end
end

class RailwayStation
  attr_reader :name
  def initialize(name)
    @name = name
    @trains = []
  end
  
  def train_arrive(train)
    @trains << train    
  end

  def get_trains(type=nil)
    
    if type.nil?
      @trains.each do |train|
        puts train
      end
    else
      @trains.each do |train|
        puts train if train.type == type
      end
    end
  end

  def train_leave(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start_point, end_point)
    if start_point.class == RailwayStation && end_point.class == RailwayStation
      @stations = [start_point, end_point]
    else
      puts "ОШИБКА: Хотя бы одна их указанных станций не существует"
    end

  end

  def add_station(station)
    if station.class == RailwayStation
      @stations.insert(-2, station)
    else
      puts "Такой станции не существует, сначала задайте станцию"
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
