class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.string :name
      t.string :picture_url
      t.references :funeral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
