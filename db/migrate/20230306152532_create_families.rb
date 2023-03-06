class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.string :godparents
      t.string :pets_care
      t.string :plants_care
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
