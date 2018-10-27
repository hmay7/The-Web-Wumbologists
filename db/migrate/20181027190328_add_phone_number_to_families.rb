class AddPhoneNumberToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :PhoneNumber, :string
  end
end
