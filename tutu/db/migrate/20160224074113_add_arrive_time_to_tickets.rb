class AddArriveTimeToTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :time, :time
    add_column :tickets, :arrive_time, :datetime
    add_column :tickets, :leave_time, :datetime
  end
end
