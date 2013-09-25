class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :reference
      t.references :user, index: true
      t.boolean :done

      t.timestamps
    end
  end
end
