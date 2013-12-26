class AddAddressToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :address, :String
  end
end
