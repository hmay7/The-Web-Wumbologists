class RenameCapacityAvailableinshelterstocapacityavailable < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shelters, :Capacity_Available, :capacty_available
  end
end
