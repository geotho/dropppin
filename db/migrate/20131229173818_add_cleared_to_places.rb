class AddClearedToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :cleared, :boolean
  end
end
