class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :funeral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
