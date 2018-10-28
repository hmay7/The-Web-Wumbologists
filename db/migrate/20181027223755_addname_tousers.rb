class AddnameTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :contact_first_name, :string
  end
end
