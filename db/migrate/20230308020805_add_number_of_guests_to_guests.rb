class AddNumberOfGuestsToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :number_of_guests, :integer
  end
end
