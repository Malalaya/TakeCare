class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.text :guest_list
      t.references :funeral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
