class Ticket < ActiveRecord::Base

  belongs_to :train
  has_one :route, through: :train
  belongs_to :passanger

  belongs_to :end_station, class_name: "RailwayStation", foreign_key: :end_station_id
  belongs_to :start_station, class_name: "RailwayStation", foreign_key: :start_station_id

  after_create :send_notification

  # validates :number, presence: true
  # validates :seat, :end_station_id, :start_station_id, presence: true

  def leave_time
    self.start_station.leave_time(self.route)
  end

  def arrive_time
    self.start_station.arrive_time(self.route)
  end

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.passanger, self).deliver_now
  end

end
