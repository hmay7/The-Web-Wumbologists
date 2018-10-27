class Removenamefromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :name, :string
  end
end
