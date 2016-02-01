class CreatePassanger < ActiveRecord::Migration
  def change
    create_table :passangers do |t|
      t.string :name
    end
  end
end
