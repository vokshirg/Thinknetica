class CargoWagon < Wagon
	attr_reader :capacity, :free_capacity

	def initialize (capacity)
		@capacity = capacity
		@free_capacity = capacity
		super
	end

	def fill_capacity (volume)
		if @free_capacity >= volume
			@free_capacity -= volume
		else
			raise "Столько не войдет осталось #{@free_capacity}"
		end
	end

	def filled_capacity
		@capacity - @free_capacity
	end
end