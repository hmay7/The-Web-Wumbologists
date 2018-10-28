class AddcontactlastnameTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :contact_last_name, :string
  end
end
