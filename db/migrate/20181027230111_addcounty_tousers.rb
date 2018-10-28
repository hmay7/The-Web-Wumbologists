class AddcountyTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :county, :string
  end
end
