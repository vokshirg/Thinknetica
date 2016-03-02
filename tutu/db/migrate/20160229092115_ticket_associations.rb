class TicketAssociations < ActiveRecord::Migration
  def change
    # remove_belongs_to :tickets, :end_station
    # remove_belongs_to :tickets, :start_station
    # remove_belongs_to :tickets, :passanger
    # remove_belongs_to :tickets, :train
    add_belongs_to :tickets, :end_station
    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :passanger
    add_belongs_to :tickets, :train
  end
end
