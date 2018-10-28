class Reomveusersfromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :users, :references
  end
end
