class DropPassangersTable < ActiveRecord::Migration
  def change
    drop_table :passangers
  end
end
