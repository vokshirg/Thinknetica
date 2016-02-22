class AddReverseSortToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :reverse_sort, :boolean, default: false
  end
end
