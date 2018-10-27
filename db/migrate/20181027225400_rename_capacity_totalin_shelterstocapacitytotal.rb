class RenameCapacityTotalinShelterstocapacitytotal < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shelters, :Capcity_total, :capacity_total
  end
end
