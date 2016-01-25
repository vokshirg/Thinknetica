class CargoTrain < Train
  protected

  def initialize_wagons(capacity)
    @wagons << CargoWagon.new(capacity)
  end

  def type_match?(wagon)
    wagon.class == CargoWagon
  end
end
