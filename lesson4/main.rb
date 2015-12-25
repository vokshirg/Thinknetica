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

  public

  def initialize
    @st = []
    @tr = []
  end

  # Создавать станции
  def create_st
    name = ""

    while name == ""
      puts "Введите название станции"
      name = gets.chomp
      if name != ""
        break
      else
        puts "Вы указали пустое значение для названия станции"
      end
    end
    puts "Вы создали станцию \"#{name}\""
    @st << RailwayStation.new(name)
    @st[-1]
    
    
  end

  # Создавать поезда
  def create_train
    print "Введите номер типа поезда который хотите создать (\"1 - грузовой\" или \"2 -пассажирский\"): "
    type= gets.chomp.to_i
    if type == 1 || type == 2
      print "Введите количество вагонов в новом поезде: "
      wagons = gets.chomp.to_i
      
    else
      puts "Вы указали неправильный тип"
    end

    if type == 2
      @tr << PassangerTrain.new(wagons, st_by_name)
    else
      @tr << CargoTrain.new(wagons, st_by_name)
    end
    puts "Вы создали поезд №#{@tr.length}, который размещен на станции \"#{@tr[-1].current_station.name}\""
    @tr[-1]
  end

  # Добавлять вагоны к поезду
  def add_wagon
    train_by_num.add_wagon
  end

  # Отцеплять вагоны от поезда
  def del_wagon
    train_by_num.del_wagon
  end

  # Помещать поезда на станцию
  def tr_to_st
    train_by_num.move_to_station(st_by_name)
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

  protected

  def train_by_num
    num = -1
    if @tr.length > 0
      while @tr[num].nil?
        print "Введите номер поезда: "
        num = gets.chomp.to_i - 1
        puts "Такого поезда не существует" if @tr[num].nil?
      end
      train = @tr[num]
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
        puts "Такой станции не существует"
        ui
      end

    end

  end

end

railway = RailWayManager.new
railway.ui

