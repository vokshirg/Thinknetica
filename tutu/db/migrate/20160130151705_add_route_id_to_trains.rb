class AddRouteIdToTrains < ActiveRecord::Migration
  def change
  	add_belongs_to :trains, :route
  end
end
