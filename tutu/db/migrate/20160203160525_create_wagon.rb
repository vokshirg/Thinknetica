class CreateWagon < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :wagon_type
      t.integer :top_places
      t.integer :bottom_places
    end
    add_belongs_to :wagons, :train
  end
end
