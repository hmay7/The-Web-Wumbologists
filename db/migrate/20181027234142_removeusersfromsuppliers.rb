class Removeusersfromsuppliers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :suppliers, :users, :references
  end
end
