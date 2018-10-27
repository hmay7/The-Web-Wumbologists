class AddNumFamilyMembersToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :NumFamilyMembers, :integer
  end
end
