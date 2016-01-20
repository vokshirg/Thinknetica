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

  def self.all_trains(&block)
    @@stantions.each do |name, st|
      puts "Станция \"#{name}\""
      st.trains.each do |number, tr|
        print " Поезд №#{number}. "
        print "Тип: #{tr.class}. "
        puts  "Вагонов: #{tr.wagons.count}"
        tr.wagons.each do |w|
          print "    Вагон №#{w.number}. "
          print "Тип: #{w.class}. "
          if w.class == CargoWagon
            print "Свободный объем: #{w.free_capacity}. "
            puts "Занятый объем: #{w.filled_capacity}. "
          elsif w.class == PassangerWagon
            print "Свободных мест: #{w.free_places}. "
            puts "Занятых мест: #{w.occupied_places}. "
          else
            puts ""
          end
        end
      end
    end
  end

  # def self.blockst(&block)
  #   @trains.each do |tr|
  #     yield(tr)
  #   end
  # end
  
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