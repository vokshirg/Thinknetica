class Train
	attr_reader :type
	# показывать количество вагонов
	attr_reader :wagons
	# показывать текущую скорость
	attr_reader :speed

	@speed = 0
	# Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
	def initialize (type, wagons)
		@type = type
		@wagons = wagons.to_i
	end

	# Поезд может:
	# набирать скорость
	def start
		@speed = 50
	end	
	# тормозить
	def stop
		@speed = 0
	end

	# прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
	def add_wagon
		if @speed == 0 
			@wagons += 1
		else
			puts "Поезд движется, прицеплять вагоны нельзя"
		end
	end
	def del_wagon
		if @speed == 0 
			@wagons -= 1
		else
			puts "Поезд движется, отцеплять вагоны нельзя"
		end
	end

	# Принимать маршрут следования
	def set_route(route)
		if route.class == Route
			@route = route
			@current_station = route.stations[0]
		else
			puts "Данного маршрута не существует"
		end
	end

	# Перемещаться между станциями, указанными в маршруте.
	def move_to_station(station)
		@current_station = station
	end

	# Показывать предыдущую станцию, текущую, следующую, на основе маршрута
	def next_station
		@next_station = @route[@route.index(@current_station) + 1]
		puts @next_station.name
	end
	def current_station
		puts @current_station.name
	end
	def back_station
		@back_station = @route[@route.index(@current_station) - 1]
		puts @back_station.name
	end
end

class RailwayStation
	attr_reader :name
	# Имеет название, которое указывается при ее создании
	def initialize(name)
		@name = name
		@trains = []
	end

	
	# Может принимать поезда (по одному за раз)
	def train_arrive(train)
		@trains << train		
	end

	# Может показывать список всех поездов на станции, находящиеся в текущий момент
	# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
	def get_trains(type=nil)
		
		if type.nil?
			@trains.each do |train|
				puts train
			end
		else
			@trains.each do |train|
				puts train if train.type == type
			end
		end
	end

	# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
	def train_leave(train)
		@trains.delete(train)
	end
	
	
end

class Route
	# Может выводить список всех станций по-порядку от начальной до конечной
	attr_reader :stations

	# Имеет начальную и конечную станцию, а также список промежуточных станций. 
	# Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
	def initialize(start_point, end_point)
		if start_point.class == RailwayStation && end_point.class == RailwayStation
			@stations = [start_point, end_point]
		else
			puts "ОШИБКА: Хотя бы одна их указанных станций не существует"
		end

	end

	# Может добавлять станцию в список
	def add_station(station)
		if station.class == RailwayStation
			@stations.insert(-2, station)
		else
			puts "Такой станции не существует, сначала задайте станцию"
		end
	end

	# Может удалять станцию из списка
	def del_station(station)
		@stations.delete(station)
	end
	
	# Может выводить список всех станций по-порядку от начальной до конечной
	def get_stations
		print "Список станций: "
		@stations.each do |station|
			print "#{station.name} "
		end
	end
end
