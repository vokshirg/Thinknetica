class PassangerTrain < Train

  def add_wagon(wagon = PassangerWagon.new)
    super
  end

  protected

  def initialize_wagons
    @wagons << PassangerWagon.new
  end

  def type_match?(wagon)
    wagon.class == PassangerWagon
  end

end