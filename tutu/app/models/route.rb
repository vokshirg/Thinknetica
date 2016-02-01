class Route < ActiveRecord::Base
  validates :name, presence: true
	validates :name, uniqueness: true


  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

	has_many :trains
  has_many :tickets
end
