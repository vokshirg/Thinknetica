class CoupeWagon < Wagon
  validates :top_places, :bottom_places, presence: true
  validates :side_top_places, :side_bottom_places, :seat_places, absence: true

  def type_name
    'Купейный'
  end
end
