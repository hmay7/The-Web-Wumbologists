class AddContactFnameToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :ContactFname, :string
  end
end
