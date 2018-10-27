class RemoveContactFnameFromShelters < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelters, :ContactFname, :string
  end
end
