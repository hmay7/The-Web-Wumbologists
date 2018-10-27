class RemovePhonenumberFromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :PhoneNumber, :string
  end
end
