class Route < ActiveRecord::Base

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  has_many :tickets
  # has_one :ticket, through: :train

  validates :name, presence: true
  validates :name, uniqueness: true

end
