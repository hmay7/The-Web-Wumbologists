class AddsecondaryphoneTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :secondary_phone, :string
  end
end
