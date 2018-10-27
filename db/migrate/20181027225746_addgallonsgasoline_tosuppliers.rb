class AddgallonsgasolineTosuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_column :suppliers, :gasoline_gallon, :integer
  end
end
