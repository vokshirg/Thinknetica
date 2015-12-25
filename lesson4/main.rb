require_relative 'train'
require_relative 'cargotrain'
require_relative 'passangertrain'
require_relative 'route'
require_relative 'railwaystation'
require_relative 'wagon'
require_relative 'passangerwagon'
require_relative 'cargowagon'


class MyNewApp
  # Просматривать список станций и список поездов на станции
  attr_reader :st, :tr

  public

  def initialize
    @st = []
    @tr = []
  end

  # Создавать станции
  def create_st(name)
    puts "Вы создали станцию #{name}"
    @st << RailwayStation.new(name)
    
  end

  # Создавать поезда
  def create_train(type, wagons)

    st = self.st_by_name
    if type == 2
      @tr << PassangerTrain.new(wagons, st)
    else
      @tr << CarogTrain.new(wagons, st)
    end
    puts "Вы создали поезд №#{@tr.lenght}"
  end

  # Добавлять вагоны к поезду
  def add_wagon(num)
    train_by_num(num).add_wagon
  end

  # Отцеплять вагоны от поезда
  def del_wagon(num)
    train_by_num(num).del_wagon
  end

  # Помещать поезда на станцию
  def tr_to_st(num)
    train_by_num(num).move_to_station(st_by_name)
  end

 def ui
    comand = ""

    while comand != 8
      puts "_________________________________"
      puts "Введите номер команды: "
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Добавить вагон к поезду"
      puts "4. Отцепить вагон от поезда"
      puts "5. Разместить поезд на станции"
      puts "6. Список станций"
      puts "7. Список поездов"
      puts "8. Закрыть"

      comand = gets.chomp.to_i

      if comand == 1
        name = ""
        while name == ""
          puts "Введите название станции"
          name = gets.chomp
          if name != ""
            create_st(name)
            break
          else
            puts "Вы указали пустое значение для названия станции"
          end
        end

      elsif comand == 2
        puts "Введите номер типа поезда который хотите создать (\"1 - грузовой\" или \"2 -пассажирский\")"
        type= gets.chomp.to_i
        if type == 1 || type == 2
          puts "Введите количество вагонов в новом поезде"
          wagons = gets.chomp.to_i
          
          create_train(type, wagons)
        else
          puts "Вы указали неправильный тип"
        end

      elsif comand == 3
        add_wagon(train_by_num)

      elsif comand == 4
        
        del_wagon(train_by_num)

      elsif comand == 5
        tr_to_st(train_by_num)

      elsif comand == 6
        puts st

      elsif comand == 7
        puts tr

      elsif comand == 8
        break

      else
        puts "Команда задана неверно"
      end

    end
    
  end

  protected

  def train_by_num
    puts "Введите номер поезда"
    num = gets.chomp.to_i
    train = @tr[num-1]
    # return train
  end

  def st_by_name
    puts "Введите станцию на которой будет создан поезд"
    name_st = gets.chomp
    @st.each_with_index do |st|
      if st.name == name_st
        return st
        break
      end
    end
  end

end

railway = MyNewApp.new
railway.ui


