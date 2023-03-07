class CreateRelatives < ActiveRecord::Migration[7.0]
  def change
    create_table :relatives do |t|
      t.boolean :trusted, default: false
      t.references :user, null: false, foreign_key: true
      t.references :funeral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
