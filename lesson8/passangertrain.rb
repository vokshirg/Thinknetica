class PassangerTrain < Train
  protected

  def initialize_wagons(places)
    @wagons << PassangerWagon.new(places)
  end

  def type_match?(wagon)
    wagon.class == PassangerWagon
  end
end
