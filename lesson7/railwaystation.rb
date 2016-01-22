class RailwayStation
  include InstanceCounter
  include Validator
  attr_reader :name, :trains
  @@stantions = {}
  
  def initialize(name)
    @name = name.to_s.capitalize
    @trains = {}
    
    validate!

    @@stantions[@name] = self
    register_instance
  end

  def self.all
    @@stantions
  end

  # У класса RailwayStation написать метод, который принимает блок и проходит 
  # по всем поездам на станции, передавая каждый поезд в блок.
  # Используя эти и другие методы, написать код, который перебирает последовательно 
  # все станции и для каждой станции выводит список поездов в формате:
  #   Номер поезда, тип, кол-во вагонов


  def all_trains(&block)
    @trains.each do |number, train|
      print " Поезд №#{number}. "
      print "Тип: #{train.class}. "
      puts  "Вагонов: #{train.wagons.count}"
      yield(train)
    end
  end
  
  def train_arrive(train)
    @trains[train.number] = train
  end

  def get_trains(type=nil)
    
    if type.nil?
      @trains.each do |train|
        puts train
      end
    else
      @trains.each do |train|
        puts train if train.class == type
      end
    end
  end

  def train_leave(number)
    @trains.delete(number)
  end
  
end