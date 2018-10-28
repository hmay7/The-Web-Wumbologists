class AddprimaryphoneTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :primary_phone, :string
  end
end
