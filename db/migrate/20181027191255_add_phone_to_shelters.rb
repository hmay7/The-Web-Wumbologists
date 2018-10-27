class AddPhoneToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Phone, :string
  end
end
