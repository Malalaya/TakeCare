class RemoveFuneralFromFlowers < ActiveRecord::Migration[7.0]
  def change
    remove_column :flowers, :funeral_id, :integer
  end
end
