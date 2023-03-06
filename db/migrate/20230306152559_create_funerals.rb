class CreateFunerals < ActiveRecord::Migration[7.0]
  def change
    create_table :funerals do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
