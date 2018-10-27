class AddPetFriendlyToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :PetFriendly, :boolean
  end
end
