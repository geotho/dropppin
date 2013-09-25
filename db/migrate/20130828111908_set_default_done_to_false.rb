class SetDefaultDoneToFalse < ActiveRecord::Migration
  def change
  	change_column(:places, :done, :boolean, :default => false, :null => false)

  end
end
