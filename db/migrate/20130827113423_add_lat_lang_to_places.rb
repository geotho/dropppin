class AddLatLangToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :lat, :decimal, :precision => 8, :scale => 6
    add_column :places, :lng, :decimal, :precision => 9, :scale => 6
  end
end
