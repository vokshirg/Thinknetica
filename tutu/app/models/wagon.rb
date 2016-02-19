class Wagon < ActiveRecord::Base

  belongs_to :train

  validates :number, presence: true

  scope :economy, -> { where(type: EconomyWagon) }
  scope :coupe, -> { where(type: CoupeWagon) }
  scope :cb, -> { where(type: CBWagon) }
  scope :seat, -> { where(type: SeatWagon) }

  default_scope { order(:number) }

  def set_number(train)
    if train.wagons
      last_number = train.wagons.last.number
    else
      last_number = 0
    end
    last_number = train.wagons[-2].number if self.new_record?
    self.number = last_number + 1
  end

end
