class ChangeFromcapactyTocapacityInshelters < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shelters, :capacty_available, :capacity_available
  end
end
