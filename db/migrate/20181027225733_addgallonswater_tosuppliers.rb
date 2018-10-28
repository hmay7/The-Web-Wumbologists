class AddgallonswaterTosuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_column :suppliers, :water_gallons, :integer
  end
end
