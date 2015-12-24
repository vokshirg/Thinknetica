class PassangerTrain < Train

  protected

  def initialize_wagons
    @wagons << PassangerWagon.new
  end

  def type_match?(wagon)
    wagon.class == PassangerWagon
  end
  
end