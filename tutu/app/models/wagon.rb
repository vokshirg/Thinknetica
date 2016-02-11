class Wagon < ActiveRecord::Base

  belongs_to :train

  validates :number, presence: true

  before_validation :set_number

  scope :economy, -> { where(type: EconomyWagon) }
  scope :coupe, -> { where(type: CoupeWagon) }
  scope :cb, -> { where(type: CBWagon) }
  scope :seat, -> { where(type: SeatWagon) }

  default_scope { order(:number) }

  protected

  def set_number
    if self.train.wagons
      last_number = self.train.wagons.last.number
    else
      last_number = 0
    end
    self.number = last_number + 1
  end

end
