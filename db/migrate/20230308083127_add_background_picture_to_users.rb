class AddBackgroundPictureToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :background_picture, :string
  end
end
