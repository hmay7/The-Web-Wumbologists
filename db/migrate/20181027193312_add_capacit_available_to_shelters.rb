class AddCapacitAvailableToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Capacity_Available, :integer
  end
end
