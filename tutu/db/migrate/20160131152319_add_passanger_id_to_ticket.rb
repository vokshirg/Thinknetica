class AddPassangerIdToTicket < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :passanger
    add_belongs_to :tickets, :train
  end
end
