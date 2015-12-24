class CargoTrain < Train

  protected
  
  def initialize_wagons
    @wagons << CargoWagon.new
  end

  def type_match?(wagon)
    wagon.class == CargoWagon
  end

end