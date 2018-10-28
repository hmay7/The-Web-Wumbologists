class AdduserintTosuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_column :suppliers, :user_id, :integer
  end
end
