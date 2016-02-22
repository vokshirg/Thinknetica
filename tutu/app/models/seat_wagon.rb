class SeatWagon < Wagon
  validates :seat_places, presence: true
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, absence: true

  def type_name
    'Сидячий'
  end
end
