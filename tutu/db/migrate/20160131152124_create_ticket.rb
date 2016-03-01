class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number
      t.time :time
      t.string :seat

    end
  end
end
