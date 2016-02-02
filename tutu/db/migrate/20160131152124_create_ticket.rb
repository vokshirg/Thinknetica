class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number
      t.time :time
      t.string :seat

    end

    add_belongs_to :tickets, :end_station
    add_belongs_to :tickets, :start_station
  end
end
