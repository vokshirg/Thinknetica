class AddIndexes < ActiveRecord::Migration
  def change
    add_index :trains, :current_station_id
    add_index :trains, :route_id

    add_index :wagons, :train_id
    add_index :wagons, [:id, :type]

    add_index :railway_stations_routes, :route_id
    add_index :railway_stations_routes, :railway_station_id

    add_index :tickets, :train_id
    add_index :tickets, :passanger_id
    add_index :tickets, :end_station_id
    add_index :tickets, :start_station_id
  end
end
