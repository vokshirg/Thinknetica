class Train
  attr_reader :speed, :wagons
  
  def initialize(wagons, station)
    @speed = 0
    @wagons = []
    wagons.times {initialize_wagons}
    @current_station = station
    station.train_arrive(self)

  end

  def start
    @speed = 50
  end 

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    if stoped?
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

  def stoped?
    @speed == 0
  end

  def add_wagon(wagon = Wagon.new)
    if stoped? 
      if type_match?(wagon)
        @wagons << wagon 
      else 
        puts "Данный вагон нельзя прицеплять к данному типу поезда"
      end
    else
      puts "Поезд движется, прицеплять вагоны нельзя"
    end
  end

  def del_wagon
    if stoped? 
      unless @wagons.empty?
        @wagons.pop
      else
        puts "У поезда и так нет вагонов"
      end
    else
      puts "Поезд движется, отцеплять вагоны нельзя"
    end
  end


  def set_route(route)
    if route.class == Route
      @current_station.train_leave(self)
      @route = route
      @current_station = route.stations[0]
      @current_station.train_arrive(self)
    else
      puts "Данного маршрута не существует"
    end
  end

  def move_to_station(station)
    @current_station.train_leave(self)
    @current_station = station
    station.train_arrive(self)
  end

  def next_station
    if @route.stations.size >= @route.stations.index(@current_station) + 1
      @next_station = @route.stations[@route.stations.index(@current_station) + 1]
      puts @next_station.name
    else
      puts "Вы находитесь на конечной"
    end
    
  end
  def current_station
    puts @current_station.name
  end
  def back_station
    if @route.stations.index(@current_station) > 0
      @back_station = @route.stations[@route.stations.index(@current_station) - 1]
      puts @back_station.name
    else
      puts "Вы находитесь на первой станции"
    end
  end

  protected 
  def initialize_wagons
    @wagons << Wagon.new
  end
  # совпадение типа вагонов проверяется внутри метода - соблюдаем принцип инкапсуляции
  def type_match?(wagon)
    true
  end


end