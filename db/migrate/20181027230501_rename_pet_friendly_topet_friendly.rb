class RenamePetFriendlyTopetFriendly < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shelters, :PetFriendly, :pet_friendly
  end
end
