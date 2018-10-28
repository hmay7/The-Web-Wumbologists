class RemovefamilyTablefromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :familyTable
  end
end
