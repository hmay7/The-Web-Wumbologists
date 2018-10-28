class RenamegasolinegallonTogasolineGallons < ActiveRecord::Migration[5.2]
  def change
  	rename_column :suppliers, :gasoline_gallon, :gasoline_gallons
  end
end
