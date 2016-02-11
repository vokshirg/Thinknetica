class Train < ActiveRecord::Base

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons



  validates :number, presence: true
  validates :number, uniqueness: true
  # validates :wagons, uniqueness: {
  #   scope: :number,
  #   message: "К поезду не могут быть прикреплены вагоны с одинаковым номером"
  # }

  # У поезда сделать флаг - сортировка вагона. Значения: с головы/c хвоста поезда. Если выбран вариант “с головы поезда”, то вагоны на странице поезда выводятся в прямом порядке, если “с хвоста поезда” - в обратном.

  def wagons_by_type(type)
    wagons.where(type: type)
  end

  def all_top_places(type)
    @all_top_places = 0
    wagons_by_type(type).each {|w| @all_top_places += w.top_places}
    return @all_top_places
  end

  def all_bottom_places(type)
    @all_bottom_places = 0
    wagons_by_type(type).each {|w| @all_bottom_places += w.bottom_places}
    return @all_bottom_places
  end

  # Усложненное задание: используя AR Query Interface, реализовать метод в модели Train, который принимает в качестве аргумента тип вагона и тип мест (вернхние/нижние/cидячие) и вовзращает их общее кол-во для поезда (т.е. считает по всем вагонам указанного типа)

  def places_of_wagon(wagon_type, places_type)
    wagons.where(type: wagon_type).pluck(places_type.to_s).inject { |sum, n| sum + n } 
  end

end
