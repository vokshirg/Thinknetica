class AddAdminFlagToPassangers < ActiveRecord::Migration
  def change
    add_column :passangers, :admin, :boolean, default: false
  end
end
