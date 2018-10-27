class AddblanketsTosuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_column :suppliers, :blanket_quantity, :integer
  end
end
