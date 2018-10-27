class AddCapactityTotalToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Capcity_total, :integer
  end
end
