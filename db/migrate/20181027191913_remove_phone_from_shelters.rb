class RemovePhoneFromShelters < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelters, :Phone, :string
  end
end
