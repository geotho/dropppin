class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :String
  end
end
