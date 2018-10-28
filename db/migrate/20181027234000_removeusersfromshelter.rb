class Removeusersfromshelter < ActiveRecord::Migration[5.2]
  def change
  	remove_column :shelters, :users, :references
  end
end
