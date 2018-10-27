class AddNumPetsToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :NumPets, :integer
  end
end
