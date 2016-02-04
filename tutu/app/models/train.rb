class Train < ActiveRecord::Base

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons


  validates :number, presence: true

  def wagons_by_type(type)
    wagons.where(wagon_type: type)
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

end
