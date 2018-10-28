class Changecolumnaddlatttolatinusers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :AddLatitudeToUser, :latitude
  end
end
