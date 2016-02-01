class Ticket < ActiveRecord::Base
  validates :number, presence: true

  belongs_to :train
  belongs_to :passanger



end
