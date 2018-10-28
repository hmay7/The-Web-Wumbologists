class AddLatitudeToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :AddLatitudeToUser, :double
  end
end
