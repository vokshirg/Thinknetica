class PassangerTrain < Train
  def initialize(wagons, station)
    super
    while wagons > 0
      @wagons << PassangerWagon.new
      wagons -= 1
    end
  end
  def add_wagon(wagon)
    if stoped? 
      if wagon.class == PassangerWagon
        @wagons << wagon 
      else 
        puts "Данный вагон нельзя прицеплять к данному типу поезда"
      end
    else
      puts "Поезд движется, прицеплять вагоны нельзя"
    end
  end
end