require_relative 'train'
require_relative 'cargotrain'
require_relative 'passangertrain'
require_relative 'route'
require_relative 'railwaystation'
require_relative 'passangerwagon'
require_relative 'cargowagon'



# Создавать станции
st1 = RailwayStation.new("Первая")
st2 = RailwayStation.new("Вторая")
st3 = RailwayStation.new("Третья")

# Создавать поезда
wagons_new = 3
train1 = CargoTrain.new(wagons_new, st1)
puts "Поезд: #{train1}"
puts "И его вагоны (#{wagons_new}шт.): #{train1.wagons}"

train2 = PassangerTrain.new(wagons_new, st2)
# puts "Поезд: #{train2}"
# puts "И его вагоны (#{wagons_new}шт.): #{train2.wagons}"

# Добавлять вагоны к поезду
train1.add_wagon(CargoWagon.new)
puts "_____________________"
puts "Добавили новый вагон: #{train1.wagons}"
# Отцеплять вагоны от поезда
train1.del_wagon
puts "_____________________"
puts "Отцепили последний вагон: #{train1.wagons}"

# Помещать поезда на станцию
puts "_____________________"
train1.move_to_station(st1)
print "Разместили поезд на станции: "
train1.current_station

route1 = Route.new(st1,st3)
train1.set_route(route1)
puts "Задали маршрут: #{route1}"
print "Текущая станция: "
train1.current_station
print "Следующая станция: "
train1.next_station
print "Предыдущая станция: "
train1.back_station

# Просматривать список станций и список поездов на станции
puts "_____________________"
puts "Список всех станций:" 
st1.all
