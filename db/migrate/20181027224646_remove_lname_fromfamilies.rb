class RemoveLnameFromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :Lname, :string
  end
end
