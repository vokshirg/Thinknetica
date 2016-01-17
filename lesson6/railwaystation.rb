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