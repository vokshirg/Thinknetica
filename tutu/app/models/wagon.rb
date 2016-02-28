class Wagon < ActiveRecord::Base

  belongs_to :train

  before_validation on: :create do
    last_number = self.train.wagons.maximum(:number) || 0
    self.number = last_number + 1
  end

  validates :number, presence: true

  scope :economy, -> { where(type: EconomyWagon) }
  scope :coupe, -> { where(type: CoupeWagon) }
  scope :cb, -> { where(type: CBWagon) }
  scope :seat, -> { where(type: SeatWagon) }

  default_scope { order(:number) }

end
