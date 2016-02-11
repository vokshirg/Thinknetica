class Wagon < ActiveRecord::Base

  belongs_to :train


  validates :number, presence: true

  before_validation :set_number

  scope :economy, -> { where(type: EconomyWagon) }
  scope :coupe, -> { where(type: CoupeWagon) }
  scope :cb, -> { where(type: CBWagon) }
  scope :seat, -> { where(type: SeatWagon) }

  default_scope { order(:number) }
  # scope :reverse_sort, -> { reorder(number: :desc)  }




  protected

  def set_number
    if Wagon.last
      last_number = Wagon.last.id
    else
      last_number = 0
    end
    self.number = last_number + 1
  end

end


class CoupeWagon < Wagon
  validates :top_places, :bottom_places, presence: true
  validates :side_top_places, :side_bottom_places, :seat_places, absence: true

  def type_name
    'Купейный'
  end
end

class EconomyWagon < Wagon
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, presence: true
  validates :seat_places, absence: true

  def type_name
    'Плацкартный'
  end
end


class CBWagon < Wagon
  validates :bottom_places, :side_bottom_places, presence: true
  validates :top_places, :side_top_places, :seat_places, absence: true

  def type_name
    'CB'
    end
end

class SeatWagon < Wagon
  validates :seat_places, presence: true
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, absence: true

  def type_name
    'Сидячий'
  end
end
