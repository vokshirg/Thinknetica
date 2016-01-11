class CargoTrain < Train

  def add_wagon(wagon = CargoWagon.new)
    super
  end

  protected

  def initialize_wagons
    @wagons << CargoWagon.new
  end

  def type_match?(wagon)
    wagon.class == CargoWagon
  end

end