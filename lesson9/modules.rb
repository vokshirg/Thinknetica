module Manufacturer
  @manufacturer = ''
  def manufacturer=(man)
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

module Validator

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(target, val_type_name, *args)
      @validations ||= {}
      @validations[target] = {val_type_name => [*args]}
      # puts "____validate___#{@validations}"
    end
  end

  module InstanceMethods

    def valid?
      validate!
    rescue
      false
    end

    protected

    NUMBER_PATTERN = /(.|\d){3}-*(.|\d){2}/i
    RAILWAYSTATION_NAME_PATTERN = /[a-zA-Z]{4,}/

    def validate!

      if self.class.validations
        if self.class.validations.each do |validation|
            target = validation[0]
            val = validation[1].first
            val_type = val.first
            val_params = val.last
            # puts "we should validate #{target} by:#{val_type} with params#{val_params}"
            self.send(val_type, target, val_params)
          end
          return true
        else
          return false
        end
      end

    end

    def presence(target, *args)
      var = self.instance_variable_get("@#{target}")
      if var.class == String ? !var.empty? : var.presence
        true
      else
        raise "#{target} не может быть пустым"
      end
    end

    def type(target, *args)
      check_class = args[0][0]
      var = instance_variable_get("@#{target}").class
      if var == check_class
        true
      else
        raise "Недопустимый тип"
      end
    end

    def format(target, *args)
      format_pattern = args[0]
      if instance_variable_get("@#{target}") !~ format_pattern
        true
      else
        raise 'Указан неверный формат'
      end
    end
  end

end


module Attrs

  def attr_accessor_with_history (*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_hist = "@#{name}_history".to_sym

      define_method(name.to_sym) {instance_variable_get var_name}

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set var_name_hist, [] unless instance_variable_get(var_name_hist)
        instance_variable_set var_name, value
        hist = instance_variable_get(var_name_hist)
        hist << value
        instance_variable_set var_name_hist, hist
      end

      define_method("#{name}_history".to_sym) { instance_variable_get(var_name_hist).inspect }

    end
  end

  def strong_attr_acessor (name, class_type)
    var_name = "@#{name}".to_sym

    define_method(name.to_sym) {instance_variable_get var_name}
    define_method("#{name}=".to_sym) do |value|
      if value.class.to_s == class_type
        instance_variable_set var_name, value
      else
        raise 'Error TypeMatch'
      end
    end

  end

end
