class Train < ActiveRecord::Base

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true
  validates :number, uniqueness: true
  # if self.wagons
    # validates :wagons, uniqueness: {
    #   scope: :number,
    #   message: "К поезду не могут быть прикреплены вагоны с одинаковым номером"
    # }
  # end

  def wagons_by_type(type)
    wagons.where(type: type)
  end

  def places_of_wagon(wagon_type, places_type)
    wagons.where(type: wagon_type).sum(places_type.to_s)
  end

end
