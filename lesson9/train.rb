class Train
  include Manufacturer, InstanceCounter, Validator
  extend Attrs
  attr_reader :speed, :wagons, :current_station
  attr_accessor :number

  NUMBER_PATTERN = /(.|\d){3}-*(.|\d){2}/i

  validate :current_station, :type, RailwayStation
  validate :number, :format, NUMBER_PATTERN
  validate :number, :presence

  @@trains = {}

  def initialize(number, wagons, volume, station)
    @speed = 0
    @wagons = []
    @number = number.to_s
    @current_station = station
    wagons.times { initialize_wagons(volume) }

    validate!
    station.train_arrive(self)
    fail "Train with number \"#{@number}\" already exist" unless self.class.find(@number).nil?
    @@trains[@number] = self
    register_instance
  end

  def all_wagons(&_block)
    @wagons.each do |w|
      yield(w)
    end
  end

  def self.find(number)
    @@trains[number]
  end

  def self.all
    @@trains
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
    else
      stop
    end
  end

  def stop
    @speed = 0
  end

  def stoped?
    @speed == 0
  end

  def add_wagon(wagon)
    if stoped?
      if type_match?(wagon)
        @wagons << wagon
      else
        fail "Данный вагон нельзя прицеплять к данному типу поезда"
      end
    else
      fail "Поезд движется, прицеплять вагоны нельзя"
    end
  end

  def del_wagon
    if stoped?
      fail "У поезда и так нет вагонов" unless @wagons.empty?
      @wagons.pop
    else
      fail "Поезд движется, отцеплять вагоны нельзя"
    end
  end

  def set_route(route)
    if route.class == Route
      @current_station.train_leave(self)
      @route = route
      @current_station = route.stations[0]
      @current_station.train_arrive(self)
    else
      fail "Данного маршрута не существует"
    end
  end

  def move_to_station(station)
    @current_station.train_leave(self)
    @current_station = station
    station.train_arrive(self)
  end

  def next_station
    if @route.stations.size >= @route.stations.index(@current_station) + 1
      @next_station = @route.stations[
        @route.stations.index(@current_station) + 1
      ]
      puts @next_station.name
    else
      puts "Вы находитесь на конечной"
    end
  end

  def back_station
    if @route.stations.index(@current_station) > 0
      @back_station = @route.stations[
        @route.stations.index(@current_station) - 1
      ]
      puts @back_station.name
    else
      puts "Вы находитесь на первой станции"
    end
  end

  protected

  def initialize_wagons(volume)
    @wagons << Wagon.new(volume)
  end

  def type_match?(_wagon)
    true
  end
end
