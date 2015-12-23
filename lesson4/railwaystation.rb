class RailwayStation
  attr_reader :name
  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
  end

  
  # Может принимать поезда (по одному за раз)
  def train_arrive(train)
    @trains << train    
  end

  # Может показывать список всех поездов на станции, находящиеся в текущий момент
  # Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
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

  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def train_leave(train)
    @trains.delete(train)
  end
  
  
end