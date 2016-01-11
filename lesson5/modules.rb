module Manufacturer
	@manufacturer = ""
	def set_manufacturer(man)
		# self.manufacturer = man
		@manufacturer = man
	end

	def manufacturer
		# puts self.manufacturer
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
		
		# @inst = 0
		def instances
			# @inst
			self.class.class_variable_get(:@@inst)
		end

		# protected

		# def register_instance
		# 	@inst += 1
		# end
	end

	module InstanceMethods
		protected
		def register_instance
			puts self.class.class_variables
			# self.class.register_instance
			self.class.class_variable_set(:@@inst, self.class.class_variable_get(:@@inst)+1)
		end
	end

end