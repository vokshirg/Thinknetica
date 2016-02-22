class EconomyWagon < Wagon
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, presence: true
  validates :seat_places, absence: true

  def type_name
    'Плацкартный'
  end
end
