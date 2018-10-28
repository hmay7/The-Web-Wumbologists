class AdduserintToshelters < ActiveRecord::Migration[5.2]
  def change
  	add_column :shelters, :user_id, :integer
  end
end
