class Train
  attr_reader :type
  # показывать количество вагонов
  attr_reader :wagons
  # показывать текущую скорость
  attr_reader :speed

  @speed = 0
  # Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
  def initialize (type, wagons)
    @type = type
    @wagons = wagons.to_i
  end

  # Поезд может:
  # набирать скорость
  def start
    @speed = 50
  end 
  # тормозить
  def stop
    @speed = 0
  end

  # прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_wagon
    if @speed == 0 
      @wagons += 1
    else
      puts "Поезд движется, прицеплять вагоны нельзя"
    end
  end
  def del_wagon
    if @speed == 0 
      @wagons -= 1
    else
      puts "Поезд движется, отцеплять вагоны нельзя"
    end
  end

  # Принимать маршрут следования
  def set_route(route)
    if route.class == Route
      @route = route
      @current_station = route.stations[0]
    else
      puts "Данного маршрута не существует"
    end
  end

  # Перемещаться между станциями, указанными в маршруте.
  def move_to_station(station)
    @current_station = station
  end

  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
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