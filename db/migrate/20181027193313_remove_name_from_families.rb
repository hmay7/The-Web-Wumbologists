class RemoveNameFromFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_column :families, :Name, :string
  end
end
