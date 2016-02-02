class Ticket < ActiveRecord::Base

  belongs_to :train
  # has_one :route, through: :train
  belongs_to :passanger

  validates :number, presence: true

  def last_station
    @last_stantion = train.route.railway_stations.last
  end

  def first_station
    @first_stantion = train.route.railway_stations.first
  end

end
