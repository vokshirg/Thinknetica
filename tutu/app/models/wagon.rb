class Wagon < ActiveRecord::Base

  belongs_to :train

  validates :top_places, :bottom_places,  numericality: { only_integer: true }
end
