class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :number

  def initialize(volume)
    register_instance
    @number = self.class.instances
  end
end
