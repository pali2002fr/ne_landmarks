class CreateLandscapes < ActiveRecord::Migration
  def change
    create_table :landscapes do |t|
      t.string :latitude
      t.string :longitude
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
