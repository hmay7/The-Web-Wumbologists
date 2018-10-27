class RemoveFnameFromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :Fname, :string
  end
end
