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
    @@inst = 0
    base.extend ClassMethods
    base.send :include, InstanceMethods
    
  end

  module ClassMethods
    
    attr_accessor :inst
    @inst = 0

    def instances
      @inst
    end

  end

  module InstanceMethods
    protected
    def register_instance
      puts self.class.class_variables
      unless self.class.inst.nil? 
        self.class.inst += 1 
      else
        self.class.inst = 1
      end
    end
  end

end