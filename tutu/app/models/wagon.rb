class Wagon < ActiveRecord::Base

  belongs_to :train

  validates :top_places, :bottom_places,  numericality: { only_integer: true }

  def type_name
    wagon_type == 1 ? 'Плацкартный' : 'Купейный'
  end
end
