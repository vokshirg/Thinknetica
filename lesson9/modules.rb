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

    def validate(target, val_type_name, *args)
      # puts "target_name #{target_name}"

      # target = instance_variable_get("@#{target_name}")
      puts "Target: #{target}"
      val_type = "#{val_type_name}".to_sym

      case val_type
      when :presence
        puts "Валидация имени: #{!target.nil? && !target.empty?}"
      when :format
        pattern = args[0] 
        puts "Валидация формата: #{!(target.to_s =~ pattern).nil?}"
      when :type
        type = args[0]
        puts "Валидация типа: #{target.is_a?(type)}"
      else 
        fail "нет такой валидации"
      end
      puts

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
      # if self.class == Train
      #   fail 'Wrong Number format [aaaaa, 11111, aaa-11, 111-aa]' if @number !~ NUMBER_PATTERN
      #   fail 'Wrong number of wagons' if @wagons[0].nil? || @wagons.length > 682 # The longest train in the world :)
      #   fail 'Wrong RailwayStation' if @current_station.class != RailwayStation
      #   true
      # elsif self.class == RailwayStation
      #   fail 'Wrong name, min 4 symb and just letters' if @name !~ RAILWAYSTATION_NAME_PATTERN
      #   true
      # elsif self.class == Route
      #   fail "ОШИБКА: Хотя бы одна их указанных станций не существует" unless start_point.class == RailwayStation && end_point.class == RailwayStation
      #   true
      # else
      #   true
      # end
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
        fail 'Error TypeMatch'
      end
    end
      
  end

end




