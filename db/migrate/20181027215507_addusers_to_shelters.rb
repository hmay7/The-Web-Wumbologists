class AddusersToShelters < ActiveRecord::Migration[5.2]
  def change
  	add_column :shelters, :users, :references
  end
end
