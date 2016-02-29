class AddPassangerInfoToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passanger_info, :string
  end
end
