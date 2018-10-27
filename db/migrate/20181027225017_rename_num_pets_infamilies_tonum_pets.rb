class RenameNumPetsInfamiliesTonumPets < ActiveRecord::Migration[5.2]
  def change
  	rename_column :families, :NumPets, :num_pets
  end
end
