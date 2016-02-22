class CBWagon < Wagon
  validates :bottom_places, :side_bottom_places, presence: true
  validates :top_places, :side_top_places, :seat_places, absence: true

  def type_name
    'CB'
    end
end
