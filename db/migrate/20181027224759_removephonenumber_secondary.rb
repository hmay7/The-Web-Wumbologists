class RemovephonenumberSecondary < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :phonenumber_secondary, :string
  end
end
