class AddmealsToSuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_column :suppliers, :meals_quantity, :integer
  end
end
