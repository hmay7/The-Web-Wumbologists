class AddlongitudeTouser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :longitude, :double
  end
end
