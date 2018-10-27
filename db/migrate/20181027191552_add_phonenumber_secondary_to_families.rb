class AddPhonenumberSecondaryToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :phonenumber_secondary, :string
  end
end
