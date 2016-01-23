require_relative 'modules'
require_relative 'train'
require_relative 'cargotrain'
require_relative 'passangertrain'
require_relative 'route'
require_relative 'railwaystation'
require_relative 'wagon'
require_relative 'passangerwagon'
require_relative 'cargowagon'





class RailWayManager

  # Просматривать список станций и список поездов на станции
  attr_reader :st, :tr

  def initialize
    @st = []
    @tr = []
  end

  def ui
    comand = ""

    while comand != 9
      puts "_________________________________"
      puts "Введите номер команды: "
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Добавить вагон к поезду"
      puts "4. Отцепить вагон от поезда"
      puts "5. Разместить поезд на станции"
      puts "6. Список станций"
      puts "7. Список поездов"
      puts "8. Количество вагонов поезда"
      puts "9. Закрыть"

      comand = gets.chomp.to_i

      case comand
      when 1; create_st
      when 2; create_train
      when 3; add_wagon
      when 4; del_wagon
      when 5; tr_to_st
      when 6; puts st
      when 7; puts tr
      when 8; puts "В данном поезде #{train_by_num.wagons.length} вагонов(а)"
      when 9; break
      else
        puts "Команда задана неверно"
      end

    end
    
  end

  private
  # Создавать станции
  def create_st
    name = ""
    is_repeat = true
    while name == "" || is_repeat
      print "Введите название станции: "
      name = gets.chomp
      if @st.empty?
         is_repeat = false
       else
        @st.each do |st|
          if st.name == name
            is_repeat = true
            break
          else
            is_repeat = false
          end
        end
      end

      if name != "" && !is_repeat
        break
      else
        puts "Или Вы указали пустое значение для названия станции или такая станция уже существует"
      end
    end

    @st << RailwayStation.new(name)
    puts "Вы создали станцию \"#{name}\""
    @st[-1]
    
  end

  # Создавать поезда
  def create_train
    type = 0
    number = ""
    wagons = 0
    volume = 0

    while number == ""
      print "Введите номер нового поезда: "
      number = gets.chomp.to_s
    end

    while type != 1 && type != 2
      print "Введите номер типа поезда который хотите создать (\"1 - грузовой\" или \"2 -пассажирский\"): "
      type = gets.chomp.to_i
      if type != 1 && type != 2
        puts "Вы указали неправильный тип"
      end
    end

    while wagons <= 0
      print "Введите количество вагонов в новом поезде: "
      wagons = gets.chomp.to_i
    end

    if type == 2
      while volume <= 0
        print "Количество мест в вагоне: "
        volume = gets.chomp.to_i
      end
      @tr << PassangerTrain.new(number, wagons, volume, st_by_name)
    else
      while volume <= 0
        print "Емкость грузового вагона: "
        volume = gets.chomp.to_i
      end
      @tr << CargoTrain.new(number, wagons, volume, st_by_name)
    end
    puts "Вы создали поезд №#{@tr.length}, который размещен на станции \"#{@tr[-1].current_station.name}\""
    @tr[-1]
  end

  # Добавлять вагоны к поезду
  def add_wagon
    tr = train_by_num
    tr.add_wagon
    puts "Вы добавили вагон к поезду №#{@tr.index(tr)+1}, теперь их #{tr.wagons.length}"

  end

  # Отцеплять вагоны от поезда
  def del_wagon
    tr = train_by_num
    tr.del_wagon
    puts "Вы отцепили вагон от поезда №#{@tr.index(tr)+1}, теперь их #{tr.wagons.length}"
  end

  # Помещать поезда на станцию
  def tr_to_st
    tr = train_by_num
    st = st_by_name
    tr.move_to_station(st)
    puts "Поезд №#{@tr.index(tr)+1} размещен на станции #{st.name}"
  end

  def train_by_num
    num = -1
    if @tr.length > 0
      while @tr[num - 1].nil? || num <= 0
        print "Введите номер поезда: "
        num = gets.chomp.to_i
        puts "Такого поезда не существует" if @tr[num - 1].nil?
      end
      train = @tr[num - 1]
      train
    else
      puts "Сначала необходимо создать хотя бы один поезд"
      create_train
    end

  end

  def st_by_name
    if @st.length == 0
      puts "Необходимо создать хотя бы одну станцию"
      create_st
    else
      count = @st.length
      while count == @st.length
        print "Введите имя станции где будет размещен поезд: "
        name_st = gets.chomp
        count = 0

        @st.each_with_index do |st|
          if st.name == name_st
            return st
            break
          else
            count += 1
          end
        end

        if count == @st.length
          puts "Такой станции не существует. Существуют: "
          @st.each_with_index do |st|
            puts st.name
          end
        end  
      end
      
    end

  end

end

# railway = RailWayManager.new
# railway.ui




rs = RailwayStation.new "first"
tr = Train.new "12aaa", 1, 10, rs
tr2 = Train.new '12123', 1, 20, rs
rs2 = RailwayStation.new "second"
tr3 = CargoTrain.new "00001", 10, 10, rs2
tr4 = PassangerTrain.new '00002', 11, 10, rs2
puts "_________________________________"
puts "_________________________________"

RailwayStation.all.each do |name, st|
  puts name
  st.all_trains do |number, train|
    print " Поезд №#{number}. "
    print "Тип: #{train.class}. "
    puts  "Вагонов: #{train.wagons.count}"
    train.all_wagons do |w|
      print "    Вагон №#{w.number}. "
      print "Тип: #{w.class}. "
      if w.class == CargoWagon
        print "Свободный объем: #{w.free_capacity}. "
        puts "Занятый объем: #{w.filled_capacity}. "
      elsif w.class == PassangerWagon
        print "Свободных мест: #{w.free_places}. "
        puts "Занятых мест: #{w.occupied_places}. "
      else
        puts ""
      end

    end

  end

end
