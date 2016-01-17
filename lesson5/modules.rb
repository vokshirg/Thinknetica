module Manufacturer
  @manufacturer = ""
  def set_manufacturer(man)
    @manufacturer = man
  end

  def manufacturer
    puts @manufacturer
  end
end

module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    
  end

  module ClassMethods
    
    attr_accessor :inst

    def instances
      @inst
    end

  end

  module InstanceMethods
    protected
    
    def register_instance
      self.class.inst ||= 0
      self.class.inst += 1 
    end
  end

end