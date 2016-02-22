class AddSortNumberToRailwayStationsRoute < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :sort_number, :integer, default: 0
  end
end
