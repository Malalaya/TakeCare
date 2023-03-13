class CreateFuneralFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :funeral_flowers do |t|
      t.references :funeral, null: false, foreign_key: true
      t.references :flower, null: false, foreign_key: true

      t.timestamps
    end
  end
end
